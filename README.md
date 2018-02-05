# Master Thesis
### Planning Intelligent Agents in Minecraft using ActorSim

My Master thesis was an artificial intelligence experiment that explored the possibilities of integrating automated planning methodologies with the interactive gaming world of Minecraft. The basic idea was to investigate whether automated planning models were able to accomplish goal-based tasks inside a virtual gaming world such as Minecraft.

We designed hierarchical and classical planning problems to implement construction based goals in the Minecraft world and then compared and evaluated their performance. The planners used were SHOP2 for hierarchical planning (based on Common Lisp) and MetricFF planner for classical planning (PDDL Language). Among the benchmark problems chosen, we included construction of:
1. A simple wall
2. A square house
3. A complex house with detailed features, resembling a real world structure

SHOP2 Planner was found to produce better and faster solutions where the problem could be expressed in a hierarchical structure, whereas PDDL produced more cost-effective solutions and were more expressive in terms of additional features, functionalities etc.

We also explored the various environments/libraries (e.g: ActorSim, Microsoft Malmo, Burlapcraft) used for integrating the planning world with the gaming world. However a detailed analysis of all the environments was left as a part of future work. Other potential areas left as part of future work would include the integration of reinforcement learning and neural networks with automated planning to accomplish tasks in virtual environments, to achieve higher precision and autonomy.
