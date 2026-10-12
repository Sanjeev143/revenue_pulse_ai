import 'package:flutter/material.dart';

// void main() {
//   runApp(const RevenuePulseApp());
// }

class RevenuePulseApp extends StatelessWidget {
  const RevenuePulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RevenuePulse AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF04060C),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6C5DD3),
          surface: Color(0x99101322),
        ),
      ),
      home: const MainDashboardShell(),
    );
  }
}

class MainDashboardShell extends StatefulWidget {
  const MainDashboardShell({super.key});

  @override
  State<MainDashboardShell> createState() => _MainDashboardShellState();
}

class _MainDashboardShellState extends State<MainDashboardShell> {
  String _selectedMenu = 'Overview';

  late final Map<String, Widget> _pages = {
    'Overview': const OverviewDashboardView(),
    'Reports': const ReportsScreen(),
    'Funnels': const FunnelsScreen(),
    'Cohorts': const CohortsScreen(),
    'Insights': const InsightsScreen(),
    'Users': const UsersScreen(),
    'Accounts': const AccountsScreen(),
    'Segments': const SegmentsScreen(),
    'Activity': const ActivityScreen(),
    'Integrations': const IntegrationsScreen(),
    'Automations': const AutomationsScreen(),
    'Campaigns': const CampaignsScreen(),
    'Teams': const TeamsScreen(),
    'Settings': const SettingsScreen(),
    'Billings': const BillingsScreen(),
  };

  void _onMenuItemSelected(String title) {
    setState(() {
      _selectedMenu = title;
    });
    if (MediaQuery.of(context).size.width < 900) {
      Navigator.pop(context); // Close mobile drawer on selection
    }
  }

  Widget _buildSidebarContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6C5DD3), Color(0xFF00C9FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.bolt, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                'RevenuePulse AI',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Divider(color: Color(0x331B2038), height: 1),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              _buildNavItem('Overview', Icons.grid_view_rounded),
              const SizedBox(height: 24),
              _buildSectionHeader('ANALYTICS'),
              const SizedBox(height: 8),
              _buildNavItem('Reports', Icons.description_outlined),
              _buildNavItem('Funnels', Icons.filter_alt_outlined),
              _buildNavItem('Cohorts', Icons.pie_chart_outline),
              _buildNavItem('Insights', Icons.insights_rounded),
              const SizedBox(height: 24),
              _buildSectionHeader('ENGAGEMENT'),
              const SizedBox(height: 8),
              _buildNavItem('Users', Icons.group_outlined),
              _buildNavItem('Accounts', Icons.corporate_fare_outlined),
              _buildNavItem('Segments', Icons.bubble_chart_outlined),
              _buildNavItem('Activity', Icons.bolt_outlined),
              const SizedBox(height: 24),
              _buildSectionHeader('OPERATIONS'),
              const SizedBox(height: 8),
              _buildNavItem('Integrations', Icons.hub_outlined),
              _buildNavItem('Automations', Icons.settings_suggest_outlined),
              _buildNavItem('Campaigns', Icons.campaign_outlined),
              const SizedBox(height: 24),
              _buildSectionHeader('SETTINGS'),
              const SizedBox(height: 8),
              _buildNavItem('Teams', Icons.badge_outlined),
              _buildNavItem('Settings', Icons.settings_outlined),
              _buildNavItem('Billings', Icons.receipt_long_outlined),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Color(0x331B2038), width: 1)),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100'),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amaze Valley',
                      style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'amazevalley@gmail.com',
                      style: TextStyle(color: Color(0xFF7A839E), fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Color(0xFF7A839E), size: 18),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF7A839E),
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, IconData icon) {
    final bool isSelected = _selectedMenu == title;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _onMenuItemSelected(title),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF6C5DD3).withValues(alpha: 0.25) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: isSelected ? Border.all(color: const Color(0xFF6C5DD3).withValues(alpha: 0.5)) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? const Color(0xFF9D90FF) : const Color(0xFF7A839E),
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF9BA2BE),
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      drawer: isDesktop
          ? null
          : Drawer(
        backgroundColor: const Color(0xFF070913),
        child: _buildSidebarContent(),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF3B4AF8).withValues(alpha: 0.15),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6C5DD3).withValues(alpha: 0.12),
              ),
            ),
          ),
          Row(
            children: [
              if (isDesktop)
                Container(
                  width: 260,
                  decoration: const BoxDecoration(
                    color: Color(0xCC0B0E1B),
                    border: Border(right: BorderSide(color: Color(0x331B2038), width: 1)),
                  ),
                  child: _buildSidebarContent(),
                ),
              Expanded(
                child: Column(
                  children: [
                    if (!isDesktop)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          color: Color(0xCC0B0E1B),
                          border: Border(bottom: BorderSide(color: Color(0x331B2038), width: 1)),
                        ),
                        child: SafeArea(
                          bottom: false,
                          child: Row(
                            children: [
                              Builder(
                                builder: (context) => IconButton(
                                  icon: const Icon(Icons.menu, color: Colors.white),
                                  onPressed: () => Scaffold.of(context).openDrawer(),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'RevenuePulse AI',
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Expanded(
                      child: _pages[_selectedMenu] ?? const OverviewDashboardView(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  const GlassCard({super.key, required this.child, this.padding, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x99101322),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x33252C4A), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

// ==========================================
// 1. OVERVIEW SCREEN[cite: 1]
// ==========================================
class OverviewDashboardView extends StatelessWidget {
  const OverviewDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isDesktop ? 28 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: isDesktop ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: isDesktop ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reports',
                        style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Create, schedule, and manage your business reports.',
                        style: TextStyle(color: const Color(0xFF7A839E), fontSize: 13),
                      ),
                    ],
                  ),
                ),
                if (!isDesktop) const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    Container(
                      width: isDesktop ? 240 : double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0x99101322),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0x33252C4A)),
                      ),
                      child: const TextField(
                        style: TextStyle(color: Colors.white, fontSize: 13),
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Color(0xFF7A839E), fontSize: 13),
                          prefixIcon: Icon(Icons.search, color: Color(0xFF7A839E), size: 18),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 16, color: Colors.white),
                      label: const Text('New Report', style: TextStyle(color: Colors.white, fontSize: 13)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C5DD3),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 800) {
                  return Column(
                    children: [
                      _buildReportDistributionCard(),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _buildStatCard('Reports Generated', '156', '↑ 18.2% vs Apr 1', 'Scheduled: 48')),
                          const SizedBox(width: 16),
                          Expanded(child: _buildStatCard('Reports Viewed', '2,540', '↑ 22.6% vs Apr 1', 'By you: 1,128')),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildDataSourceCard(),
                    ],
                  );
                }
                return Row(
                  children: [
                    Expanded(flex: 2, child: _buildReportDistributionCard()),
                    const SizedBox(width: 16),
                    Expanded(child: _buildStatCard('Reports Generated', '156', '↑ 18.2% vs Apr 1', 'Scheduled: 48')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildStatCard('Reports Viewed', '2,540', '↑ 22.6% vs Apr 1', 'By you: 1,128')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildDataSourceCard()),
                  ],
                );
              },
            ),
            const SizedBox(height: 28),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 950) {
                  return Column(
                    children: [
                      _buildReportLibrary(context, constraints.maxWidth),
                      const SizedBox(height: 20),
                      _buildScheduledReports(),
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 7, child: _buildReportLibrary(context, constraints.maxWidth)),
                    const SizedBox(width: 20),
                    Expanded(flex: 5, child: _buildScheduledReports()),
                  ],
                );
              },
            ),
            const SizedBox(height: 28),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 950) {
                  return Column(
                    children: [
                      _buildReportUsage(),
                      const SizedBox(height: 20),
                      _buildShareDistribution(),
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 7, child: _buildReportUsage()),
                    const SizedBox(width: 20),
                    Expanded(flex: 5, child: _buildShareDistribution()),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportDistributionCard() {
    return GlassCard(
      height: 140,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Report Distribution', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5B45EE).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.receipt, color: Colors.white, size: 14),
                      SizedBox(height: 4),
                      Text('Revenue', style: TextStyle(color: Colors.white70, fontSize: 9)),
                      Text('42%', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B4AF8).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.group, color: Colors.white, size: 14),
                      SizedBox(height: 4),
                      Text('Customer', style: TextStyle(color: Colors.white70, fontSize: 9)),
                      Text('28%', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String subText, String footerText) {
    return GlassCard(
      height: 140,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 11)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(subText, style: const TextStyle(color: Colors.greenAccent, fontSize: 9)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(footerText.split(':').first, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 9)),
              Text(footerText.split(':').last.trim(), style: const TextStyle(color: Colors.white, fontSize: 9)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataSourceCard() {
    return GlassCard(
      height: 140,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Data Sources', style: TextStyle(color: Color(0xFF7A839E), fontSize: 11)),
              SizedBox(height: 4),
              Text('12', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 2),
              Text('Active integrations', style: TextStyle(color: Color(0xFF7A839E), fontSize: 9)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text('All sources connected', style: TextStyle(color: Colors.greenAccent, fontSize: 8)),
          ),
        ],
      ),
    );
  }

  Widget _buildReportLibrary(BuildContext context, double screenWidth) {
    int crossAxisCount = screenWidth < 600 ? 1 : (screenWidth < 1100 ? 2 : 3);
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Report Library', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text('View all', style: TextStyle(color: Color(0xFF9D90FF), fontSize: 12))),
            ],
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.35,
            children: const [
              LibraryCard(title: 'Revenue Summary', desc: 'Overview of revenue performance', tagColor: Color(0xFF5B45EE), icon: Icons.receipt),
              LibraryCard(title: 'Customer Retention', desc: 'Analyze customer retention & churn', tagColor: Color(0xFF3B4AF8), icon: Icons.group),
              LibraryCard(title: 'Acquisition Analysis', desc: 'Detailed breakdown of channels', tagColor: Color(0xFF00C9FF), icon: Icons.show_chart),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScheduledReports() {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Scheduled Reports', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text('View all', style: TextStyle(color: Color(0xFF9D90FF), fontSize: 12))),
            ],
          ),
          const SizedBox(height: 12),
          const ScheduledReportTile(title: 'Daily Executive Report', time: 'Every day at 08:00 AM', isEnabled: true),
          const ScheduledReportTile(title: 'Weekly Growth Report', time: 'Every Monday at 09:00 AM', isEnabled: true),
        ],
      ),
    );
  }

  Widget _buildReportUsage() {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Report Usage', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              Text('This Year ▾', style: TextStyle(color: Color(0xFF7A839E), fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          const Text('Views count by report category', style: TextStyle(color: Color(0xFF7A839E), fontSize: 11)),
          const SizedBox(height: 20),
          _buildUsageRow('Revenue Reports', [1, 2, 3, 2, 3, 4, 3, 2, 4, 3, 2, 4]),
          _buildUsageRow('Customer Reports', [2, 3, 1, 3, 2, 2, 4, 3, 2, 4, 3, 2]),
          _buildUsageRow('Marketing Reports', [3, 2, 4, 1, 3, 3, 2, 4, 3, 2, 4, 3]),
          _buildUsageRow('Operations Reports', [1, 1, 2, 3, 4, 2, 1, 3, 2, 3, 1, 2]),
          _buildUsageRow('Other Reports', [2, 3, 2, 1, 2, 3, 4, 2, 1, 2, 3, 4]),
        ],
      ),
    );
  }

  Widget _buildShareDistribution() {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Share & Distribution', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 130,
              height: 130,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    trackGap: 10.0,
                    value: 0.70,
                    strokeWidth: 50,
                    backgroundColor: const Color(0xFF1E233D),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF5B45EE)),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('128', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Total Deliveries', style: TextStyle(color: Color(0xFF7A839E), fontSize: 9)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildDistributionLegend('Email', '60%', Colors.blue),
          const SizedBox(height: 8),
          _buildDistributionLegend('Download Link', '25%', Colors.greenAccent),
          const SizedBox(height: 8),
          _buildDistributionLegend('Shared Dashboard', '15%', Colors.purpleAccent),
        ],
      ),
    );
  }

  Widget _buildUsageRow(String category, List<int> intensities) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(category, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 11), overflow: TextOverflow.ellipsis),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: intensities.map((val) {
                Color c = const Color(0xFF1E233D);
                if (val == 2) c = const Color(0xFF3B4AF8).withValues(alpha: 0.5);
                if (val == 3) c = const Color(0xFF5B45EE);
                if (val >= 4) c = const Color(0xFF7D6BFF);
                return Container(
                  width: 12,
                  height: 16,
                  decoration: BoxDecoration(
                    color: c,
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDistributionLegend(String label, String percent, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 12)),
          ],
        ),
        Text(percent, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class LibraryCard extends StatelessWidget {
  final String title;
  final String desc;
  final Color tagColor;
  final IconData icon;

  const LibraryCard({super.key, required this.title, required this.desc, required this.tagColor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0x66151930),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x33252C4A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: tagColor, borderRadius: BorderRadius.circular(8)),
                child: Icon(icon, color: Colors.white, size: 14),
              ),
              const Icon(Icons.star_border, color: Color(0xFF7A839E), size: 16),
            ],
          ),
          const Spacer(),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(desc, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 10), maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class ScheduledReportTile extends StatelessWidget {
  final String title;
  final String time;
  final bool isEnabled;

  const ScheduledReportTile({super.key, required this.title, required this.time, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0x66151930),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x33252C4A)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0x331E233D),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.schedule, color: Color(0xFF9D90FF), size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(time, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 10)),
              ],
            ),
          ),
          Switch(value: isEnabled, onChanged: (val) {}, activeColor: const Color(0xFF6C5DD3)),
        ],
      ),
    );
  }
}


// ==========================================
// 2. REPORTS SCREEN (6 Columns & 20 Rows Data Table)
// ==========================================
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  static final List<Map<String, String>> _reportRows = [
    {'name': 'Q3 Revenue Summary', 'category': 'Revenue', 'author': 'Amaze Valley', 'date': '2026-10-01', 'status': 'Completed', 'format': 'PDF / XLSX'},
    {'name': 'Monthly Churn Analysis', 'category': 'Customer', 'author': 'John Smith', 'date': '2026-09-30', 'status': 'Completed', 'format': 'PDF'},
    {'name': 'Ad Acquisition ROI', 'category': 'Marketing', 'author': 'Sophia Lee', 'date': '2026-09-29', 'status': 'Processing', 'format': 'XLSX'},
    {'name': 'Server Load & Uptime', 'category': 'Operations', 'author': 'DevBot AI', 'date': '2026-09-28', 'status': 'Completed', 'format': 'CSV'},
    {'name': 'ARR Growth Breakdown', 'category': 'Revenue', 'author': 'Amaze Valley', 'date': '2026-09-27', 'status': 'Completed', 'format': 'PDF / XLSX'},
    {'name': 'Enterprise Contract Renewals', 'category': 'Customer', 'author': 'John Smith', 'date': '2026-09-26', 'status': 'Pending', 'format': 'PDF'},
    {'name': 'Google Ads CTR Audit', 'category': 'Marketing', 'author': 'Sophia Lee', 'date': '2026-09-25', 'status': 'Completed', 'format': 'XLSX'},
    {'name': 'AWS Cloud Cost Optimization', 'category': 'Operations', 'author': 'DevBot AI', 'date': '2026-09-24', 'status': 'Completed', 'format': 'PDF'},
    {'name': 'Daily Active Users (DAU)', 'category': 'Customer', 'author': 'Amaze Valley', 'date': '2026-09-23', 'status': 'Completed', 'format': 'CSV'},
    {'name': 'Stripe Failed Payments', 'category': 'Revenue', 'author': 'John Smith', 'date': '2026-09-22', 'status': 'Failed', 'format': 'XLSX'},
    {'name': 'Email Open Rate Metrics', 'category': 'Marketing', 'author': 'Sophia Lee', 'date': '2026-09-21', 'status': 'Completed', 'format': 'PDF'},
    {'name': 'Database Latency Logs', 'category': 'Operations', 'author': 'DevBot AI', 'date': '2026-09-20', 'status': 'Completed', 'format': 'CSV'},
    {'name': 'Net Promoter Score (NPS)', 'category': 'Customer', 'author': 'Amaze Valley', 'date': '2026-09-19', 'status': 'Completed', 'format': 'PDF'},
    {'name': 'Upsell Conversion Rates', 'category': 'Revenue', 'author': 'John Smith', 'date': '2026-09-18', 'status': 'Pending', 'format': 'XLSX'},
    {'name': 'Social Media Engagement', 'category': 'Marketing', 'author': 'Sophia Lee', 'date': '2026-09-17', 'status': 'Completed', 'format': 'PDF'},
    {'name': 'API Gateway Traffic', 'category': 'Operations', 'author': 'DevBot AI', 'date': '2026-09-16', 'status': 'Completed', 'format': 'CSV'},
    {'name': 'Cohort Retention Week 4', 'category': 'Customer', 'author': 'Amaze Valley', 'date': '2026-09-15', 'status': 'Completed', 'format': 'PDF / XLSX'},
    {'name': 'Invoice Reconciliation', 'category': 'Revenue', 'author': 'John Smith', 'date': '2026-09-14', 'status': 'Completed', 'format': 'XLSX'},
    {'name': 'Influencer Campaign ROI', 'category': 'Marketing', 'author': 'Sophia Lee', 'date': '2026-09-13', 'status': 'Completed', 'format': 'PDF'},
    {'name': 'Security Audit & Compliance', 'category': 'Operations', 'author': 'DevBot AI', 'date': '2026-09-12', 'status': 'Completed', 'format': 'PDF'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Reports Management', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Comprehensive directory of all generated business intelligence reports.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            GlassCard(
              padding: const EdgeInsets.all(0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(const Color(0x551E233D)),
                  dataRowMinHeight: 50,
                  dataRowMaxHeight: 60,
                  columns: const [
                    DataColumn(label: Text('Report Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Category', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Generated By', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Date', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Status', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Format', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ],
                  rows: _reportRows.map((row) {
                    Color statusColor = Colors.greenAccent;
                    if (row['status'] == 'Pending') statusColor = Colors.orangeAccent;
                    if (row['status'] == 'Processing') statusColor = Colors.blueAccent;
                    if (row['status'] == 'Failed') statusColor = Colors.redAccent;

                    return DataRow(
                      cells: [
                        DataCell(Text(row['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500))),
                        DataCell(Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: const Color(0xFF6C5DD3).withValues(alpha: 0.2), borderRadius: BorderRadius.circular(6)),
                          child: Text(row['category']!, style: const TextStyle(color: Color(0xFF9D90FF), fontSize: 11)),
                        )),
                        DataCell(Text(row['author']!, style: const TextStyle(color: Color(0xFF7A839E)))),
                        DataCell(Text(row['date']!, style: const TextStyle(color: Color(0xFF7A839E)))),
                        DataCell(Row(
                          children: [
                            Container(width: 6, height: 6, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                            const SizedBox(width: 8),
                            Text(row['status']!, style: TextStyle(color: statusColor, fontSize: 12)),
                          ],
                        )),
                        DataCell(Text(row['format']!, style: const TextStyle(color: Colors.white70))),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ==========================================
// 3. OTHER SCREENS (Funnels, Cohorts, etc.)
// ==========================================
class FunnelsScreen extends StatelessWidget {
  const FunnelsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Funnels Analysis', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Track conversion bottlenecks and visitor milestones.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Conversion Step Breakdown', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  _buildFunnelStep('1. Landing Page Visitor', '45,200', 1.0, Colors.blue),
                  _buildFunnelStep('2. Signup Initiated', '18,400', 0.65, Colors.indigo),
                  _buildFunnelStep('3. Email Verified', '14,100', 0.45, Colors.purple),
                  _buildFunnelStep('4. Pro Plan Subscribed', '3,250', 0.18, Colors.greenAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFunnelStep(String name, String count, double ratio, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 13)),
              Text('$count users', style: const TextStyle(color: Color(0xFF7A839E), fontSize: 12)),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 10,
              backgroundColor: const Color(0xFF1E233D),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}

class CohortsScreen extends StatelessWidget {
  const CohortsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Cohorts Retentions', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Analyze subscriber retention cohorts over 6 months.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Retention Heatmap Matrix', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  _buildCohortRow('May 2026', ['100%', '82%', '74%', '68%', '65%', '62%']),
                  _buildCohortRow('Jun 2026', ['100%', '85%', '78%', '71%', '69%', '-']),
                  _buildCohortRow('Jul 2026', ['100%', '88%', '81%', '75%', '-', '-']),
                  _buildCohortRow('Aug 2026', ['100%', '90%', '84%', '-', '-', '-']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCohortRow(String month, List<String> vals) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text(month, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          ...vals.map((v) => Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: v == '-' ? const Color(0xFF1E233D) : const Color(0xFF6C5DD3).withValues(alpha: v.startsWith('1') ? 0.9 : 0.4),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(v, style: const TextStyle(color: Colors.white, fontSize: 11)),
            ),
          )),
        ],
      ),
    );
  }
}

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AI Business Insights', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Automated ML anomaly detection and recommendations.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            _buildInsightCard('Revenue Spike Detected', 'Enterprise tier signups increased by 42% following the latest release.', Icons.trending_up, Colors.greenAccent),
            const SizedBox(height: 16),
            _buildInsightCard('Checkout Friction Alert', 'Drop-off rate increased by 5.2% on mobile Safari browser.', Icons.warning_amber, Colors.orangeAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightCard(String title, String desc, IconData icon, Color color) {
    return GlassCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('User Management', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Manage platform users, roles, and granular permissions.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            GlassCard(
              child: Column(
                children: [
                  _userRow('Amaze Valley', 'amazevalley@gmail.com', 'Super Admin', Colors.purple),
                  const Divider(color: Color(0x331B2038), height: 24),
                  _userRow('John Smith', 'john.smith@enterprise.io', 'Billing Manager', Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userRow(String name, String email, String role, Color badgeColor) {
    return Row(
      children: [
        const CircleAvatar(backgroundColor: Color(0xFF1E233D), child: Icon(Icons.person, color: Colors.white)),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
              Text(email, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 11)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: badgeColor.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(6)),
          child: Text(role, style: TextStyle(color: badgeColor, fontSize: 11, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enterprise Accounts', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Monitor enterprise subscriptions, renewals, and contracts.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            _accountCard('Stellar Corp', '\$48,000 ARR', 'Renews in 45 days', Colors.greenAccent),
          ],
        ),
      ),
    );
  }

  Widget _accountCard(String name, String arr, String renewal, Color color) {
    return GlassCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(renewal, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 11)),
                ],
              ),
            ],
          ),
          Text(arr, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class SegmentsScreen extends StatelessWidget {
  const SegmentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Audience Segments', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Build behavioral customer segments for targeted campaigns.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _segmentChip('High Value Power Users', '1,420 users'),
                _segmentChip('At-Risk Churners', '310 users'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _segmentChip(String title, String count) {
    return GlassCard(
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(count, style: const TextStyle(color: Color(0xFF9D90FF), fontSize: 12)),
        ],
      ),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('System Activity Logs', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Auditing trail of all workspace events and data queries.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            GlassCard(
              child: Column(
                children: [
                  _logTile('API Token Generated', 'by amazevalley@gmail.com', '2 mins ago'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logTile(String action, String user, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(action, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            Text(user, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 11)),
          ],
        ),
        Text(time, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 11)),
      ],
    );
  }
}

class IntegrationsScreen extends StatelessWidget {
  const IntegrationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Data Integrations', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Connect APIs, webhooks, and third-party data warehouses.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(child: _integrationCard('Stripe Billing', 'Connected', true)),
                const SizedBox(width: 16),
                Expanded(child: _integrationCard('GitHub Actions', 'Connected', true)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _integrationCard(String name, String status, bool isConnected) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
              Container(width: 8, height: 8, decoration: BoxDecoration(color: isConnected ? Colors.greenAccent : Colors.redAccent, shape: BoxShape.circle)),
            ],
          ),
          const SizedBox(height: 12),
          Text(status, style: TextStyle(color: isConnected ? Colors.greenAccent : Color(0xFF7A839E), fontSize: 12)),
        ],
      ),
    );
  }
}

class AutomationsScreen extends StatelessWidget {
  const AutomationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Workflows & Automations', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Configure automated webhook alerts and report dispatches.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            GlassCard(
              child: Column(
                children: [
                  _automationRow('Daily Slack Revenue Alert', 'Triggered every day at 8:00 AM', true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _automationRow(String title, String desc, bool active) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 2),
              Text(desc, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 11)),
            ],
          ),
        ),
        Switch(value: active, onChanged: (v) {}, activeColor: const Color(0xFF6C5DD3)),
      ],
    );
  }
}

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Marketing Campaigns', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Manage outbound email sequences and ad performance metrics.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Active Drip Sequences', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _campaignRow('Q3 Product Launch Blast', '14,200 sent', '42.8% open rate'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _campaignRow(String title, String sent, String openRate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            Text(sent, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 11)),
          ],
        ),
        Text(openRate, style: const TextStyle(color: Colors.greenAccent, fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Team Workspaces', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Collaborate across departments and assign workspace ownership.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            GlassCard(
              child: Column(
                children: [
                  _teamRow('Engineering Team', '8 members', 'Primary codebase & deployments'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _teamRow(String name, String members, String desc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            Text(desc, style: const TextStyle(color: Color(0xFF7A839E), fontSize: 11)),
          ],
        ),
        Text(members, style: const TextStyle(color: Color(0xFF9D90FF), fontSize: 12)),
      ],
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Workspace Settings', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Manage company branding, security policies, and billing info.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Company Branding', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Workspace Name',
                      labelStyle: TextStyle(color: Color(0xFF7A839E)),
                      filled: true,
                      fillColor: Color(0xFF1E233D),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BillingsScreen extends StatelessWidget {
  const BillingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Billing & Invoices', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('View subscription plan details, invoices, and credit usage.', style: TextStyle(color: Color(0xFF7A839E), fontSize: 13)),
            const SizedBox(height: 28),
            GlassCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Enterprise Plan', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('\$299/month • Renews on Oct 1, 2026', style: TextStyle(color: Color(0xFF7A839E), fontSize: 12)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6C5DD3)),
                    child: const Text('Manage Plan', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}