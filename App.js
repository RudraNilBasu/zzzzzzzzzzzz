import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Hello World!</Text>
      <Text>This is a new line!</Text>
      <Text>This is another new line!!!!!!!</Text>
      <Text>This is a new line!</Text>
      <Text>This is a new line!</Text>
      <Text>This is a new line!</Text>
      <Text>This is a new line!</Text>
      <Text>This is a new line!</Text>
      <Text>This is a new line!</Text>
      <Text>This is a new line!</Text>
      <Text>Bye :)</Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#894',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
