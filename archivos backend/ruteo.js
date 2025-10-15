const express = require('express');
const router = express.Router();
const mainController = require('../controladores/controlador');
const authMiddleware = require('../middlewares/authMiddleware'); // Importa el middleware
const { soloAlumnos, soloAlumnado, soloAdministradores} = require('../middlewares/roles')
const db = require('../basededatos/modelos');

// Aplica el middleware antes de las rutas
router.use(mainController.cargarUsuario);

// Rutas de registro y acceso público
router.get('/registrarse', mainController.registrarse);
router.get('/acceder', mainController.acceder); // Página de acceder
router.post('/iniciar', mainController.iniciar); // Acción para iniciar sesión


// Rutas protegidas por el middleware de autenticación
router.get('/', authMiddleware, mainController.index); // Página principal
router.get('/pagdeinicio', authMiddleware, mainController.pagdeinicio); // Página de inicio
router.get('/notas',authMiddleware, soloAlumnos, mainController.notas); // Página de las notas
router.get('/perfil', authMiddleware, mainController.perfil); // Página del perfil
router.get('/gestionar', authMiddleware, soloAlumnado, mainController.gestion); // Página de gestionar alumnos
router.get('/curso/:cursoId/materia/:materiaId', authMiddleware, soloAlumnado, mainController.alumnos); // Página de alumnos
router.get('/materias/:id', authMiddleware, soloAlumnado, mainController.materias); // Página de materias
router.get('/vernotas', authMiddleware, mainController.vernotas); // ver notas profes
router.get('/materiaalumnado/:id', authMiddleware, soloAlumnado, mainController.materiaalumnado); // nose
router.get('/notaspuestas/:cursoId/materia/:materiaId', authMiddleware, soloAlumnado, mainController.notaspuestas); // nose
router.get('/administrar', authMiddleware, soloAdministradores, mainController.administrar);

router.post('/validar', mainController.validar);

// Ruta para guardar las notas
router.post('/curso/:cursoId/materia/:materiaID', authMiddleware, soloAlumnado, mainController.guardarNotas);

// Ruta para cerrar sesión
router.post("/cerrar-sesion", authMiddleware, mainController.cerrar);

// Ruta para cambiar el rol de un usuario
router.post('/cambiar-rol/:id', authMiddleware, soloAdministradores, async (req, res) => {
    const usuarioId = req.params.id;
    const nuevoRol = req.body.nuevo_rol;
    try {
        await db.Persona.update(
            { tipo_usuario_id: nuevoRol },
            { where: { id: usuarioId } }
        );
        res.redirect('/administrar');
    } catch (error) {
        res.status(500).send('Error al cambiar el rol');
    }
});

mainController.administrar = async (req, res) => {
    try {
        const usuarios = await db.Persona.findAll();
        res.render('administrar', { usuarios });
    } catch (error) {
        res.status(500).send('Error al cargar usuarios');
    }
};

module.exports = router;