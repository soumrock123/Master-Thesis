# Master Thesis
Planning Intelligent Agents in Minecraft using ActorSim

The basic objective of my Master thesis was to explore the possibilities of integrating automated planning methodologies with the interactive gaming world of Minecraft. We designed hierarchical and classical planning problems to implement construction based goals in the Minecraft world and then compared and evaluated their performance. The planners used were SHOP2 for hierarchical planning, (based on Common Lisp) and FF Metric planner for classical planning (PDDL Language).

SHOP2 Planner was found to produce better and faster solutions where the problem could be expressed in a hierarchical structure, whereas PDDL produced more cost-effective solutions.

We also explored the various environments/libraries (e.g: ActorSim, Malmo, Burlapcraft) used for integrating the planning world with the gaming world. However a detailed analysis of all the environments was left as a part of future work. Other potential areas left as part of future work included the exploration of reinforcement learning and neural networks, along with automated planning to accomplish tasks in virtual environments.
