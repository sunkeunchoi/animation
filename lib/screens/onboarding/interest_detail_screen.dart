import 'package:animation_class/screens/onboarding/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class InterestDetailScreen extends StatefulWidget {
  const InterestDetailScreen({super.key});

  @override
  State<InterestDetailScreen> createState() => _InterestDetailScreenState();
}

class _InterestDetailScreenState extends State<InterestDetailScreen> {
  final Set selectedItems = {};

  final List<String> musicItems = [
    "Rap",
    "R&B & sould",
    "Grammy Awards",
    "Pop",
    "K-pop",
    "Music industry",
    "EDA",
    "Music news",
    "Hip hop",
    "Reggae",
    "Pop",
    "K-pop",
    "Music industry",
    "EDA",
    "Classical",
    "Blues",
    "Folk & Americana",
    "Metal",
    "Punk",
    "Electronic",
    "Music news",
    "Hip hop",
    "Reggae",
    "Indie",
    "Funk",
    "Gospel",
    "Christian",
    "Singer-songwriter",
    "Music festivals",
    "Music history",
  ];

  final List<String> entertainmentItems = [
    "Anime",
    "Movies & TV",
    "Harry Potter",
    "Marvel Universe",
    "Movie news",
    "Naruto",
    "Movies",
    "Grammy Awards",
    "Entertainment industry",
  ];

  final List<String> travelItems = [
    "Seoul",
    "Canda",
    "New Zealand",
    "New York",
    "London",
    "Paris",
    "Madrid",
    "Barcelona",
    "Rome",
    "Milan",
    "Zurich",
    "Amsterdam",
    "Sydney",
  ];
  void addItem(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  bool isSelected(String item) {
    return selectedItems.contains(item);
  }

  @override
  Widget build(BuildContext context) {
    var musicSize = musicItems.length ~/ 3;
    var entertainmentSize = entertainmentItems.length ~/ 3;
    var travelSize = travelItems.length ~/ 3;
    return Common(
      bottomAppBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 0.5)],
        ),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Row(
            children: [
              const Spacer(),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "What do you want to see on Twitter?",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Interests are used to peronalize your experience and will be visible on your porfile.",
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            const SizedBox(height: 20),
            Text(
              "Music",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ItemScroll(
              addItem: addItem,
              isSelected: isSelected,
              itemList: musicItems,
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            const SizedBox(height: 20),
            Text(
              "Entertainment",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ItemScroll(
              addItem: addItem,
              isSelected: isSelected,
              itemList: entertainmentItems,
            ),
            const SizedBox(height: 20),
            Text(
              "Travel",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ItemScroll(
              addItem: addItem,
              isSelected: isSelected,
              itemList: travelItems,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemScroll extends StatelessWidget {
  const ItemScroll({
    super.key,
    required this.itemList,
    required this.addItem,
    required this.isSelected,
  });
  final List<String> itemList;
  final void Function(String) addItem;
  final bool Function(String) isSelected;

  @override
  Widget build(BuildContext context) {
    var itemSize = itemList.length ~/ 3;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: itemList
                .take(itemSize)
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                      top: 10,
                    ),
                    child: GestureDetector(
                      onTap: () => addItem(item),
                      child: ItemWidget(
                        isSelected: isSelected(item),
                        text: item,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Wrap(
            children: itemList
                .skip(itemSize)
                .take(itemSize)
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                      top: 10,
                    ),
                    child: GestureDetector(
                      onTap: () => addItem(item),
                      child: ItemWidget(
                        isSelected: isSelected(item),
                        text: item,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Wrap(
            children: itemList
                .skip(itemSize * 2)
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                      top: 10,
                    ),
                    child: GestureDetector(
                      onTap: () => addItem(item),
                      child: ItemWidget(
                        isSelected: isSelected(item),
                        text: item,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.isSelected,
    required this.text,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.white : Colors.grey.shade400,
            ),
            color: isSelected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
