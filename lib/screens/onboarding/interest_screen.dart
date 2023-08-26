import 'package:animation_class/screens/onboarding/interest_detail_screen.dart';
import 'package:animation_class/screens/onboarding/widgets/app_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final Set selectedItems = {};
  final List<String> items = [
    "Fashion & beauty",
    "Outdoors",
    "Arts & culture",
    "Animation \n& comics",
    "Business \n& finance",
    "Food",
    "Travel",
    "Entertainment",
    "Music",
    "Gaming",
    "Sports",
    "News & politics",
    "Science & tech",
    "Fun",
    "Lifestyle",
    "Health & fitness",
    "Parenting",
    "Home & garden",
    "Education",
    "Spirituality",
    "Books & writing",
    "Pets",
    "Photography",
    "Auto",
    "TV",
    "Movies",
    "Shopping",
    "Comedy",
    "Design",
    "Dating & relationships",
    "Adult content",
    "Podcasts",
    "Beauty",
    "Social justice",
    "Makers & crafting",
    "Hobbies & interests",
    "Nonprofits",
    "Activism",
    "Journalism",
    "Government",
    "Weather",
    "Local news",
    "College & high school",
    "Professional organizations",
    "Fan clubs",
    "Sports teams",
    "Brands",
    "Animals",
    "Celebrities",
    "Humor",
    "Family",
    "Friends",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Common(
      bottomAppBar: BottomSection(
        selected: selectedItems.length,
        onTap: () {
          if (selectedItems.length < 3) {
            return;
          }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InterestDetailScreen()),
          );
        },
      ),
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
            "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
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
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2 / 1,
              ),
              itemBuilder: (context, index) {
                var isSelected = selectedItems.contains(index);
                var text = items[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedItems.remove(index);
                      } else {
                        selectedItems.add(index);
                      }
                    });
                  },
                  child: CategoryCard(isSelected: isSelected, text: text),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.isSelected,
    required this.text,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? Colors.blue : Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Icon(
              FluentIcons.checkmark_circle_24_filled,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black,
                height: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
    required this.selected,
    required this.onTap,
  });

  final int selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 0.5)],
      ),
      child: BottomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Row(
          children: [
            selected < 3
                ? Text(
                    "$selected of 3 selected",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                  )
                : Text(
                    "Great work 🎉",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                  ),
            const Spacer(),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: selected < 3 ? Colors.grey.shade600 : Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: selected < 3 ? Colors.grey.shade400 : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
