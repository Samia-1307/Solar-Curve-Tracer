t = out.Vpv_log.time;
V = out.Vpv_log.signals.values;

I = out.Ipv_log.signals.values;
I = abs(I);                      % optional if current sign is inverted

% keep data after 0.005 s (or use sweep window)
idx = (t >= 0.005);

V2 = V(idx);
I2 = I(idx);
P2 = V2 .* I2;

% I-V curve
figure;
plot(V2, I2, 'LineWidth', 1.5); grid on;
xlabel('V_{pv} (V)');
ylabel('I_{pv} (A)');
title('I-V Curve (t \ge 0.005 s)');

% P-V curve
figure;
plot(V2, P2, 'LineWidth', 1.5); grid on;
xlabel('V_{pv} (V)');
ylabel('P_{pv} (W)');
title('P-V Curve (t \ge 0.005 s)');