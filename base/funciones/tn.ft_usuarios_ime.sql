CREATE OR REPLACE FUNCTION "tn"."ft_usuarios_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		TIENDA
 FUNCION: 		tn.ft_usuarios_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'tn.tusuarios'
 AUTOR: 		 (admin)
 FECHA:	        23-03-2016 22:52:33
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:

 DESCRIPCION:	
 AUTOR:			
 FECHA:		
***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_usuario	integer;
			    
BEGIN

    v_nombre_funcion = 'tn.ft_usuarios_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'TN_USU_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-03-2016 22:52:33
	***********************************/

	if(p_transaccion='TN_USU_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into tn.tusuarios(
			nombre,
			loguin,
			password,
			estado_reg,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.nombre,
			v_parametros.loguin,
			v_parametros.password,
			'activo',
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_usuario into v_id_usuario;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','USUARIO DE TIENDA almacenado(a) con exito (id_usuario'||v_id_usuario||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_usuario',v_id_usuario::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'TN_USU_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-03-2016 22:52:33
	***********************************/

	elsif(p_transaccion='TN_USU_MOD')then

		begin
			--Sentencia de la modificacion
			update tn.tusuarios set
			nombre = v_parametros.nombre,
			loguin = v_parametros.loguin,
			password = v_parametros.password,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_usuario=v_parametros.id_usuario;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','USUARIO DE TIENDA modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_usuario',v_parametros.id_usuario::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'TN_USU_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-03-2016 22:52:33
	***********************************/

	elsif(p_transaccion='TN_USU_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from tn.tusuarios
            where id_usuario=v_parametros.id_usuario;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','USUARIO DE TIENDA eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_usuario',v_parametros.id_usuario::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

	end if;

EXCEPTION
				
	WHEN OTHERS THEN
		v_resp='';
		v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
		v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
		v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
		raise exception '%',v_resp;
				        
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "tn"."ft_usuarios_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
