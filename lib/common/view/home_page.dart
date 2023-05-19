import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('뷰티 케어'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => context.pushNamed('login'),
                icon: const Icon(Icons.login),
              ),
              IconButton(
                onPressed: () => context.pushNamed('mypage'),
                icon: const Icon(Icons.person),
              ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () => context.pushNamed('survey'),
              //   child: const Text('설문조사'),
              // ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () => context.pushNamed('survey'),
                //   child: const Text('설문조사'),
                // ),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.pushNamed('predictSkinMbti'),
                          child: const Text('AI로 피부 MBTI 예측하기'),
                        ),
                      ]),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              context.pushNamed('predictSkinDisease'),
                          child: const Text('AI로 나의 피부 질환 예측하기'),
                        ),
                      ]),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.pushNamed('survey'),
                          child: const Text('피부타입 문진'),
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
