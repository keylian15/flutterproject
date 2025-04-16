class Craftingpage extends ConsumerStatefulWidget {
  const Craftingpage({super.key});

  @override
  ConsumerState<Craftingpage> createState() => _CraftingpageState();
}

class _CraftingpageState extends ConsumerState<Craftingpage> {
  List<CraftSlot> slots = List.generate(9, (_) => CraftSlot());

  void handleItemDrop(int index, BlockData block) {
    setState(() {
      slots[index] = CraftSlot(block: block);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appStoreProvider);

    final widgets = <Widget>[];
    for (final block in state.blocks) {
      widgets.add(
        Draggable<BlockData>(
          data: block,
          feedback: Material(
            color: Colors.transparent,
            child: Image.network(block.image, height: 40),
          ),
          childWhenDragging: Opacity(
            opacity: 0.4,
            child: BlockWidget(nameSpacedId: block.nameSpacedId, showText: true),
          ),
          child: BlockWidget(nameSpacedId: block.nameSpacedId, showText: true),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 30),
                buildCraftingGrid(slots, handleItemDrop), // 👈 Table interactive
                const SizedBox(height: 10),
                Expanded(
                  child: state.blocks.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemCount: widgets.length,
                          itemBuilder: (context, index) => widgets[index],
                        ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}
