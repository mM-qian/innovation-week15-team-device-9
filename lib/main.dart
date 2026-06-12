import 'package:flutter/material.dart';

void main() {
  runApp(const TeamDeviceApp());
}

/// 第9组创新实验第15周 Flutter 应用
/// 团队协作与 Android 真机运行
class TeamDeviceApp extends StatelessWidget {
  const TeamDeviceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: projectTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TeamDeviceHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// 组员 A 修改区域：应用标题、口号和小组成员名称
/// ============================================
/// 修改以下三个常量，改为第9组真实信息
static const String groupName = '第9组 创新实验团队';
static const String projectTitle = 'Flutter Android 真机验收看板';
static const String projectSlogan = '用 GitHub 协作，把第14周个人 Hello World 升级成小组真机运行成果';
/// ============================================

/// 组员 B 修改区域：团队成员信息与分工
/// ============================================
/// 修改以下成员列表，改为第9组真实分工
static const List<TeamMember> members = [
  TeamMember(role: '组长', name: '邓卓', task: '合并 PR、真机运行、创建仓库'),
  TeamMember(role: '组员 A', name: 'N', task: '修改标题、口号和小组名'),
  TeamMember(role: '组员 B', name: '马敏楠', task: '补全成员信息与分工'),
  TeamMember(role: '组员 C', name: '请填写姓名', task: '补充 Android 真机检查项'),
  TeamMember(role: '组员 D', name: '请填写姓名', task: '补充证据规则、README 照片说明'),
];
/// ============================================

/// 组员 C 修改区域：真机运行检查项
/// ============================================
/// 修改以下检查项，补充本组实际检查过的内容
static const List<String> realDeviceChecks = [
  '主电脑能执行 flutter doctor，并识别 Android toolchain',
  '数据线连接正常，手机显示为文件传输模式',
  '手机已开启 USB 调试',
  'adb devices 能看到设备且状态为 device',
  'flutter devices 能识别到 Android 设备',
  'flutter run 能成功安装并运行到真机',
  '运行设备型号：请填写实际型号',
];
/// ============================================

/// 组员 D 修改区域：证据规则和 README 说明
/// ============================================
/// 修改以下证据规则，补充本组 README 中要保留的证据
static const List<String> evidenceRules = [
  '证据照片必须由第二部手机拍摄，不能用本机截图代替',
  '照片中能看到手持 Android 手机',
  'Android 手机屏幕显示本组 Flutter App',
  '画面不要出现聊天记录、手机号、定位、身份证等隐私信息',
  '文件名建议为 android-real-device.jpg',
  '放入项目 images/ 目录',
  '提交到 GitHub',
  'README 中能显示这张照片',
];
/// ============================================

/// 团队成员数据模型
class TeamMember {
  final String role;
  final String name;
  final String task;

  const TeamMember({
    required this.role,
    required this.name,
    required this.task,
  });
}

/// 主页面
class TeamDeviceHomePage extends StatefulWidget {
  const TeamDeviceHomePage({super.key});

  @override
  State<TeamDeviceHomePage> createState() => _TeamDeviceHomePageState();
}

class _TeamDeviceHomePageState extends State<TeamDeviceHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const MembersTab(),
    const DeviceCheckTab(),
    const EvidenceTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectTitle),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: '成员'),
          BottomNavigationBarItem(icon: Icon(Icons.phone_android), label: '真机检查'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: '证据规则'),
        ],
      ),
    );
  }
}

/// 首页 Tab
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(groupName, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(projectSlogan, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('本周任务：', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('1. 小组用 Fork + Pull Request 协作修改同一 Flutter 项目'),
          const Text('2. 组长合并所有组员贡献'),
          const Text('3. 小组把最终 App 运行到真实 Android 手机上'),
          const Text('4. 用第二部手机拍摄真机运行照片'),
          const Text('5. 把协作过程和照片写入 GitHub README'),
        ],
      ),
    );
  }
}

/// 成员 Tab
class MembersTab extends StatelessWidget {
  const MembersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: members.length,
      itemBuilder: (context, index) {
        final member = members[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(member.role.substring(0, 1)),
            ),
            title: Text(member.name),
            subtitle: Text('${member.role}：${member.task}'),
          ),
        );
      },
    );
  }
}

/// 真机检查 Tab
class DeviceCheckTab extends StatelessWidget {
  const DeviceCheckTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: realDeviceChecks.length,
      itemBuilder: (context, index) {
        return CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text(realDeviceChecks[index]),
        );
      },
    );
  }
}

/// 证据规则 Tab
class EvidenceTab extends StatelessWidget {
  const EvidenceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: evidenceRules.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.check_circle_outline),
          title: Text(evidenceRules[index]),
        );
      },
    );
  }
}
