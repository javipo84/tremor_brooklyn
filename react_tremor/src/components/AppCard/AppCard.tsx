import { Card, Text, Metric } from '@tremor/react';
import React, { FC } from 'react';
import styles from './AppCard.module.css';

interface AppCardProps {}

const AppCard: FC<AppCardProps> = () => (
  <div className={styles.AppCard}>
    <Card maxWidth="max-w-sm">
      <Text>Sales</Text>
      <Metric>$ 71,465</Metric>
    </Card>
  </div>
);

export default AppCard;
