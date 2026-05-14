import 'package:flutter/material.dart';
import 'package:todo_app/constants/todo_constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _darkMode = false;
  String _language = 'TR';
  String _sortBy = 'dueDate';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Başlık
        Padding(
          padding: EdgeInsets.all(TodoConstants.paddingMedium),
          child: Text(
            'Ayarlar',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),

        // Bildirimler Bölümü
        _buildSectionHeader('Bildirimler'),
        _buildSettingsTile(
          title: 'Bildirimleri Aç/Kapat',
          subtitle: 'Görev bildirimleri al',
          trailing: Switch(
            value: _notifications,
            onChanged: (value) {
              setState(() => _notifications = value);
            },
          ),
        ),
        Divider(),

        // Görünüm Bölümü
        _buildSectionHeader('Görünüm'),
        _buildSettingsTile(
          title: 'Koyu Tema',
          subtitle: 'Koyu mod etkinleştir',
          trailing: Switch(
            value: _darkModeTheme,
            onChanged: (value) {
              setState(() => _darkMode = value);
            },
          ),
        ),
        Divider(),

        // Dil Bölümü
        _buildSectionHeader('Genel'),
        _buildDropdownTile(
          title: 'Dil',
          subtitle: 'Uygulama dilini seçin',
          value: _language,
          items: ['TR', 'EN'],
          onChanged: (value) {
            setState(() => _language = value);
          },
        ),
        Divider(),

        // Sıralama Bölümü
        _buildDropdownTile(
          title: 'Görevleri Sırala',
          subtitle: 'Sıralama ölçütünü seçin',
          value: _sortBy,
          items: ['dueDate', 'priority', 'created'],
          onChanged: (value) {
            setState(() => _sortBy = value);
          },
        ),
        Divider(),

        // Hakkında Bölümü
        _buildSectionHeader('Hakkında'),
        _buildSettingsTile(
          title: 'Versiyon',
          subtitle: '1.0.0',
          onTap: () {},
        ),
        _buildSettingsTile(
          title: 'Gizlilik Politikası',
          subtitle: 'Gizlilik politikasını oku',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gizlilik politikası yakında gelecek')),
            );
          },
        ),
        _buildSettingsTile(
          title: 'Kullanım Koşulları',
          subtitle: 'Kullanım koşullarını oku',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Kullanım koşulları yakında gelecek')),
            );
          },
        ),
        Divider(),

        // Veri Bölümü
        _buildSectionHeader('Veri'),
        _buildSettingsTile(
          title: 'Tüm Görevleri Sil',
          subtitle: 'Bütün görevleri kalıcı olarak silin',
          titleColor: Colors.red,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Tüm Verileri Sil?'),
                content: Text('Bu işlem geri alınamaz!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('İptal'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Veri silme işlemi tamamlandı')),
                      );
                    },
                    child: Text('Sil', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            );
          },
        ),

        SizedBox(height: TodoConstants.paddingLarge),
      ],
    );
  }

  bool get _darkModeTheme => _darkMode;

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        TodoConstants.paddingMedium,
        TodoConstants.paddingMedium,
        TodoConstants.paddingMedium,
        TodoConstants.paddingSmall,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: TodoConstants.subtitleFontSize,
          fontWeight: FontWeight.bold,
          color: TodoConstants.darkGreen,
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color titleColor = const Color(0xFF212121),
  }) {
    return ListTile(
      title: Text(title, style: TextStyle(color: titleColor)),
      subtitle: Text(subtitle),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildDropdownTile({
    required String title,
    required String subtitle,
    required String value,
    required List<String> items,
    required Function(String) onChanged,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: DropdownButton<String>(
        value: value,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            onChanged(newValue);
          }
        },
      ),
    );
  }
}
