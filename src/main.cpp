#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <iostream>

void handleUserInput(GLFWwindow* window, int key, int scancode, int action, int mods)
{
	switch (key)
	{
	case GLFW_KEY_ESCAPE:
		if (action == GLFW_PRESS)
		{
			std::cout << "ESCAPE pressed" << std::endl;
		}
		break;
	default: break;
	}
}

int main(void)
{
	GLFWwindow* window;

	if (!glfwInit())
	{
		return 1;
	}

	window = glfwCreateWindow(640, 480, "Hello OpenGL", NULL, NULL);
	if (!window)
	{
		glfwTerminate();
		return 1;
	}

	glfwMakeContextCurrent(window);
	gladLoadGLLoader((GLADloadproc) glfwGetProcAddress);

	glfwSetKeyCallback(window, handleUserInput);

	while (!glfwWindowShouldClose(window))
	{
		glClear(GL_COLOR_BUFFER_BIT);

		glfwSwapBuffers(window);

		glfwPollEvents();
	}

	glfwTerminate();
	return 0;
}

