import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Smeta Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/registration',
      builder: (context, state) => const RegistrationScreen(),
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) => const ResetPasswordScreen(),
    ),
    GoRoute(
      path: '/projects',
      builder: (context, state) => const CreateProjectScreen(),
    ),
    GoRoute(
      path: '/work-reference',
      builder: (context, state) => const WorkReferenceScreen(),
    ),
    GoRoute(
      path: '/template-estimate',
      builder: (context, state) => const TemplateEstimateScreen(),
    ),
  ],
);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        context.go('/home');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите логин и пароль')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Login', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'login/email',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Войти'),
              ),
              TextButton(
                onPressed: () => context.go('/registration'),
                child: const Text('Зарегистрироваться'),
              ),
              TextButton(
                onPressed: () => context.go('/reset-password'),
                child: const Text('Забыли пароль'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _register() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пароли не совпадают')),
        );
        return;
      }

      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        context.go('/login');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Регистрация успешна!')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните все поля')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Регистрация', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Пароль',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Подтвердите пароль',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Зарегистрироваться'),
              ),
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('Назад к входу'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  void _resetPassword() async {
    if (emailController.text.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        context.go('/login');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Инструкции отправлены на почту')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите email')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Сброс пароля', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _resetPassword,
                child: const Text('Отправить'),
              ),
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('Назад к входу'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: const Color(0xFFFF9800),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      children: [
                        _HeaderButton(
                          text: 'Создать проект',
                          onTap: () => context.go('/projects'),
                        ),
                        _HeaderButton(
                          text: 'Таблица / Таблица смет',
                          onTap: () {},
                        ),
                        _HeaderButton(
                          text: 'Справочник работ',
                          onTap: () => context.go('/work-reference'),
                        ),
                        _HeaderButton(
                          text: 'Справочник шаблонов смет',
                          onTap: () => context.go('/template-estimate'),
                        ),
                        _HeaderButton(
                          text: 'История изменений',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Синаптик',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  // Каждый проект — Map с полями 'name' и 'modules' (список модулей)
  final List<Map<String, dynamic>> projects = [];
  final TextEditingController projectController = TextEditingController();
  int? selectedProjectIndex;

  // Заглушки доступных модулей
  final List<Map<String, dynamic>> availableModules = [
    {'name': 'Модуль авторизации', 'requiredTime': 10},
    {'name': 'Модуль формирования доски', 'requiredTime': 20},
    {'name': 'Модуль оплаты', 'requiredTime': 15},
    {'name': 'Модуль подсчёта голосов', 'requiredTime': 12},
  ];

  // Создать новый проект — добавляем новый элемент с пустым списком модулей
  void _createProject() {
    setState(() {
      projects.add({
        'name': 'Новый проект',
        'modules': <Map<String, dynamic>>[],
      });
      selectedProjectIndex = projects.length - 1;
      projectController.text = 'Новый проект';
    });
  }

  // При нажатии на элемент списка проектов делаем его выбранным и отображаем его данные
  void _selectProject(int index) {
    setState(() {
      selectedProjectIndex = index;
      projectController.text = projects[index]['name'];
    });
  }

  // Сохранить изменения выбранного проекта (обновляем его имя)
  void _saveProject() {
    if (selectedProjectIndex != null && projectController.text.isNotEmpty) {
      setState(() {
        projects[selectedProjectIndex!]['name'] = projectController.text;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Проект сохранён')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Выберите проект и введите его название')),
      );
    }
  }

  // Добавляем модуль в выбранный проект
  void _addModule(Map<String, dynamic> module) {
    if (selectedProjectIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Сначала создайте или выберите проект')),
      );
      return;
    }
    setState(() {
      // Добавляем копию модуля в список модулей выбранного проекта
      (projects[selectedProjectIndex!]['modules'] as List)
          .add(Map<String, dynamic>.from(module));
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              'Модуль "${module['name']}" добавлен в проект "${projects[selectedProjectIndex!]['name']}"')),
    );
  }

  // Подсчитываем итоговое время для выбранного проекта
  int get _totalRequiredTime {
    if (selectedProjectIndex == null) return 0;
    final modules = projects[selectedProjectIndex!]['modules'] as List;
    int total = 0;
    for (var mod in modules) {
      total += mod['requiredTime'] as int;
    }
    return total;
  }

  // Кнопка возврата на главный экран
  void _goBack() {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создание проекта'),
        backgroundColor: const Color(0xFFFF9800),
        centerTitle: true,
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _goBack,
          ),
        ],
      ),
      body: Column(
        children: [
          // Постоянная верхняя панель с кнопками (side-bar)
          Container(
            color: const Color(0xFFFF9800),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _HeaderButton(
                  text: 'Создать проект',
                  onTap: _createProject,
                ),
                _HeaderButton(
                  text: 'Сохранить',
                  onTap: _saveProject,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Левая панель – список проектов и данные выбранного проекта
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Список проектов:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => _selectProject(index),
                                child: Container(
                                  color: selectedProjectIndex == index
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.transparent,
                                  child: ListTile(
                                    title: Text(projects[index]['name']),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Если проект выбран, отображаем его данные
                        if (selectedProjectIndex != null) ...[
                          TextField(
                            controller: projectController,
                            decoration: const InputDecoration(
                              labelText: 'Название проекта',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Модули проекта:',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: (projects[selectedProjectIndex!]['modules'] as List).length,
                              itemBuilder: (context, index) {
                                final mod = (projects[selectedProjectIndex!]['modules'] as List)[index];
                                return ListTile(
                                  title: Text(mod['name']),
                                  subtitle: Text('Время: ${mod['requiredTime']} ч'),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.white,
                            child: Text(
                              'Итоговое время: $_totalRequiredTime ч',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
                // Правая панель – выбор модуля (заглушка)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Доступные модули:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: availableModules.length,
                            itemBuilder: (context, index) {
                              final module = availableModules[index];
                              return ListTile(
                                title: Text(module['name']),
                                subtitle: Text('Необходимое время: ${module['requiredTime']} ч'),
                                trailing: GestureDetector(
                                  onTap: () => _addModule(module),
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 10,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WorkReferenceScreen extends StatefulWidget {
  const WorkReferenceScreen({super.key});

  @override
  State<WorkReferenceScreen> createState() => _WorkReferenceScreenState();
}

class _WorkReferenceScreenState extends State<WorkReferenceScreen> {
  final List<Map<String, dynamic>> works = [];
  final TextEditingController workNameController = TextEditingController();
  final TextEditingController requiredTimeController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController laborController = TextEditingController();
  int? selectedWorkIndex;
  String selectedSpecialist = 'AN';
  double customerTime = 0;

  // Список специалистов
  final List<Map<String, String>> specialists = [
    {'code': 'AN', 'name': 'Аналитика'},
    {'code': 'DE', 'name': 'Дизайн'},
    {'code': 'MD', 'name': 'Мобильная разработка'},
    {'code': 'BE', 'name': 'Back-end разработка'},
    {'code': 'FE', 'name': 'Frontend разработка'},
    {'code': 'DO', 'name': 'DevOPS'},
    {'code': 'QA', 'name': 'Тестирование'},
    {'code': 'PM', 'name': 'Менеджмент'},
  ];

  // Выбираем работу из списка
  void _selectWork(int index) {
    setState(() {
      selectedWorkIndex = index;
      workNameController.text = works[index]['name'];
      requiredTimeController.text = works[index]['requiredTime'].toString();
      selectedSpecialist = works[index]['specialist'];
      costController.text = works[index]['cost'].toString();
      laborController.text = works[index]['labor'].toString();
      customerTime = works[index]['requiredTime'] * 2;
    });
  }

  // Сохранить изменения или добавить новую работу
  void _saveWork() {
    if (workNameController.text.isEmpty ||
        requiredTimeController.text.isEmpty ||
        costController.text.isEmpty ||
        laborController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните все поля')),
      );
      return;
    }

    final newWork = {
      'name': workNameController.text,
      'requiredTime': double.parse(requiredTimeController.text),
      'specialist': selectedSpecialist,
      'customerTime': customerTime,
      'cost': double.parse(costController.text),
      'labor': double.parse(laborController.text),
    };

    setState(() {
      if (selectedWorkIndex == null) {
        works.add(newWork);
      } else {
        works[selectedWorkIndex!] = newWork;
      }
      _clearFields();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Работа "${newWork['name']}" успешно сохранена')),
    );
  }

  // Очистка полей после сохранения или отмены
  void _clearFields() {
    workNameController.clear();
    requiredTimeController.clear();
    costController.clear();
    laborController.clear();
    selectedSpecialist = 'AN';
    customerTime = 0;
    selectedWorkIndex = null;
  }

  // Обновляем время для заказчика при изменении необходимого времени
  void _updateCustomerTime(String value) {
    final requiredTime = double.tryParse(value) ?? 0;
    setState(() {
      customerTime = requiredTime * 2;
    });
  }

  // Кнопка возврата на главный экран
  void _goBack() {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Справочник работ'),
        backgroundColor: const Color(0xFFFF9800),
        centerTitle: true,
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _goBack,
          ),
        ],
      ),
      body: Column(
        children: [
          // Постоянная верхняя панель с кнопками (side-bar)
          Container(
            color: const Color(0xFFFF9800),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _HeaderButton(
                  text: 'Сохранить работу',
                  onTap: _saveWork,
                ),
                _HeaderButton(
                  text: 'Очистить',
                  onTap: _clearFields,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Левая панель – список работ
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Список работ:',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: works.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => _selectWork(index),
                                child: Container(
                                  color: selectedWorkIndex == index
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.transparent,
                                  child: ListTile(
                                    title: Text(works[index]['name']),
                                    subtitle: Text(
                                        'Время: ${works[index]['requiredTime']} ч'),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Правая панель – форма редактирования/добавления работы
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: workNameController,
                            decoration: const InputDecoration(
                              labelText: 'Название работы',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: requiredTimeController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Необходимое время (ч)',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: _updateCustomerTime,
                          ),
                          const SizedBox(height: 16),
                          InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Специалист',
                              border: OutlineInputBorder(),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedSpecialist,
                                isExpanded: true,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedSpecialist = value;
                                    });
                                  }
                                },
                                items: specialists
                                    .map((spec) => DropdownMenuItem(
                                  value: spec['code'],
                                  child:
                                  Text('${spec['code']} — ${spec['name']}'),
                                ))
                                    .toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child:
                            Text('Время для заказчика: $customerTime ч'),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: costController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Стоимость (₽)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: laborController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Трудоёмкость',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TemplateEstimateScreen extends StatefulWidget {
  const TemplateEstimateScreen({super.key});

  @override
  State<TemplateEstimateScreen> createState() => _TemplateEstimateScreenState();
}

class _TemplateEstimateScreenState extends State<TemplateEstimateScreen> {
  // Список шаблонов смет. Каждый шаблон — Map с 'name' и списком 'phases'
  final List<Map<String, dynamic>> templates = [
    {
      'name': 'смета VPN',
      'phases': ['Этап 1', 'Этап 2', 'Этап 3'],
    },
    {
      'name': 'смета Личный кабинет ВятГУ',
      'phases': ['Этап 1', 'Этап 2', 'Этап 3'],
    },
    {
      'name': 'смета Браузер',
      'phases': ['Этап 1', 'Этап 2', 'Этап 3'],
    },
    {
      'name': 'смета Car-washing',
      'phases': ['Этап 1', 'Этап 2', 'Этап 3'],
    },
  ];

  int? selectedTemplateIndex;
  int? selectedPhaseIndex;

  // Контроллеры для полей формы правой панели
  final TextEditingController phaseNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController devTimeController = TextEditingController(); // время разработки (например, "3д 2ч")
  final TextEditingController projectOutcomeController = TextEditingController(); // Итог проекта (разработка *2)
  final TextEditingController laborHoursController = TextEditingController(); // трудоёмкость, ч
  final TextEditingController laborDaysController = TextEditingController(); // трудоёмкость, д
  final TextEditingController costController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  String selectedSpecialist = 'AN';
  final List<Map<String, String>> specialists = [
    {'code': 'AN', 'name': 'Аналитика'},
    {'code': 'DE', 'name': 'Дизайн'},
    {'code': 'MD', 'name': 'Мобильная разработка'},
    {'code': 'BE', 'name': 'Back-end разработка'},
    {'code': 'FE', 'name': 'Frontend разработка'},
    {'code': 'DO', 'name': 'DevOPS'},
    {'code': 'QA', 'name': 'Тестирование'},
    {'code': 'PM', 'name': 'Менеджмент'},
  ];

  // При выборе шаблона сметы и этапа обновляем поля формы (если ранее были сохранены данные)
  void _selectTemplate(int index) {
    setState(() {
      selectedTemplateIndex = index;
      selectedPhaseIndex = null;
      _clearPhaseFields();
    });
  }

  void _selectPhase(int index) {
    setState(() {
      selectedPhaseIndex = index;
      // Если в будущем храним данные для этапа, их можно подгрузить здесь.
      // Пока просто заполняем имя этапа:
      phaseNameController.text =
      templates[selectedTemplateIndex!]['phases'][index];
      // Оставляем остальные поля пустыми для ввода
      descriptionController.clear();
      devTimeController.clear();
      projectOutcomeController.clear();
      laborHoursController.clear();
      laborDaysController.clear();
      costController.clear();
      startDateController.clear();
      endDateController.clear();
      selectedSpecialist = 'AN';
    });
  }

  // При изменении трудоёмкости (в часах) вычисляем время разработки и итог проекта.
  void _updateTimeCalculations(String value) {
    final laborHours = double.tryParse(value) ?? 0;
    // Пример: 3д 2ч. Допустим, 1 день = 8 часов.
    // Мы можем вычислить дни и остаток часов:
    final days = laborHours ~/ 8;
    final hours = laborHours % 8;
    // Время разработки = введённые часы, преобразованные в формат "Xd Yh"
    devTimeController.text = '${days}д ${hours.toInt()}ч';
    // Итог проекта = время разработки * 2 (в днях и часах)
    final totalHours = laborHours * 2;
    final totalDays = totalHours ~/ 8;
    final totalRemainHours = totalHours % 8;
    projectOutcomeController.text = '${totalDays}д ${totalRemainHours.toInt()}ч';
    // Также запишем трудоёмкость в днях
    laborDaysController.text = totalDays.toString();
  }

  // Очистка полей правой панели
  void _clearPhaseFields() {
    phaseNameController.clear();
    descriptionController.clear();
    devTimeController.clear();
    projectOutcomeController.clear();
    laborHoursController.clear();
    laborDaysController.clear();
    costController.clear();
    startDateController.clear();
    endDateController.clear();
    selectedSpecialist = 'AN';
  }

  // Функция сохранения этапа (здесь можно добавить логику сохранения в базу)
  void _savePhase() {
    if (phaseNameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        devTimeController.text.isEmpty ||
        projectOutcomeController.text.isEmpty ||
        laborHoursController.text.isEmpty ||
        costController.text.isEmpty ||
        startDateController.text.isEmpty ||
        endDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните все поля этапа')),
      );
      return;
    }
    // Здесь можно сохранить данные этапа в структуру шаблона сметы
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Этап "${phaseNameController.text}" сохранён')),
    );
  }

  // Функция возврата на главный экран
  void _goBack() {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Справочник шаблонов смет'),
        backgroundColor: const Color(0xFFFF9800),
        centerTitle: true,
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _goBack,
          ),
        ],
      ),
      body: Column(
        children: [
          // Верхняя панель с кнопками (side-bar)
          Container(
            color: const Color(0xFFFF9800),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _HeaderButton(
                  text: 'Сохранить этап',
                  onTap: _savePhase,
                ),
                _HeaderButton(
                  text: 'Очистить',
                  onTap: _clearPhaseFields,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Левая панель: список шаблонов смет и этапов
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Шаблоны смет:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: templates.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => _selectTemplate(index),
                                child: Container(
                                  color: selectedTemplateIndex == index
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.transparent,
                                  child: ListTile(
                                    title: Text(templates[index]['name']),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (selectedTemplateIndex != null) ...[
                          const Text(
                            'Этапы:',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: templates[selectedTemplateIndex!]['phases'].length,
                              itemBuilder: (context, index) {
                                final phase = templates[selectedTemplateIndex!]['phases'][index];
                                return GestureDetector(
                                  onTap: () => _selectPhase(index),
                                  child: Container(
                                    color: selectedPhaseIndex == index
                                        ? Colors.green.withOpacity(0.3)
                                        : Colors.transparent,
                                    child: ListTile(
                                      title: Text(phase),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                // Правая панель: форма редактирования этапа
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: phaseNameController,
                            decoration: const InputDecoration(
                              labelText: 'Название этапа',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: descriptionController,
                            decoration: const InputDecoration(
                              labelText: 'Описание',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: devTimeController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Время разработки (рассчитано)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: projectOutcomeController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Итоги по проекту (х2)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Специалисты',
                              border: OutlineInputBorder(),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedSpecialist,
                                isExpanded: true,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedSpecialist = value;
                                    });
                                  }
                                },
                                items: specialists
                                    .map((spec) => DropdownMenuItem(
                                  value: spec['code'],
                                  child: Text('${spec['code']} — ${spec['name']}'),
                                ))
                                    .toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: laborHoursController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Трудоёмкость, ч',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: _updateTimeCalculations,
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: laborDaysController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Трудоёмкость, д',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: costController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Стоимость (₽)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: startDateController,
                            decoration: const InputDecoration(
                              labelText: 'Дата начала',
                              border: OutlineInputBorder(),
                            ),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (date != null) {
                                setState(() {
                                  startDateController.text =
                                  '${date.day}/${date.month}/${date.year}';
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: endDateController,
                            decoration: const InputDecoration(
                              labelText: 'Дата окончания',
                              border: OutlineInputBorder(),
                            ),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (date != null) {
                                setState(() {
                                  endDateController.text =
                                  '${date.day}/${date.month}/${date.year}';
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _HeaderButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.purple[600],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

