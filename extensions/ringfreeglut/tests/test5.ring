/*
	This sample is based on C Tutorials 
	from : http://www.lighthouse3d.com/tutorials/glut-tutorial/
*/

load "freeglut.ring"
load "opengl21lib.ring"

angle = 0

func main

	// init GLUT and create window
	glutInit()
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA)
	glutInitWindowPosition(100,100)
	glutInitWindowSize(320,320)
	glutCreateWindow("RingFreeGLUT - Test 5")

	glutDisplayFunc(:renderScene)
	glutReshapeFunc(:changeSize)
	glutIdleFunc(:renderScene)

	glutMainLoop()

func renderScene

	// Clear Color and Depth Buffers
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

	// Reset transformations
	glLoadIdentity()
	// Set the camera
	gluLookAt(	0.0, 0.0, 10.0,
				0.0, 0.0,  0.0,
				0.0, 1.0,  0.0)

	glRotatef(angle, 0.0, 1.0, 0.0)

	glBegin(GL_TRIANGLES)
		glVertex3f(-2.0,-2.0, 0.0)
		glVertex3f( 2.0, 0.0, 0.0)
		glVertex3f( 0.0, 2.0, 0.0)
	glEnd()

	angle+=0.1

	glutSwapBuffers();

func changesize

	h = glutEventHeight()
	w = glutEventWidth()

		// Prevent a divide by zero, when window is too short
	// (you cant make a window of zero width).
	if (h = 0)
		h = 1
	ok

	ratio =  w * 1.0 / h

	// Use the Projection Matrix
	glMatrixMode(GL_PROJECTION)

	// Reset Matrix
	glLoadIdentity()

	// Set the viewport to be the entire window
	glViewport(0, 0, w, h)

	// Set the correct perspective.
	gluPerspective(45,ratio,1,100)

	// Get Back to the Modelview
	glMatrixMode(GL_MODELVIEW)
