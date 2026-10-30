Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398737;
	b=ABMI9uLgbdvAEoeYf9Rkw9Wj4JznFP5YgWyznuvNj1Pa9o69PvAo53LJJzF9HQDzBJ5m
	 urNfCoMM7ZuMgnyWasNI4hY5/eqMGSgOr681vmM2mxU7IsRDTMobFgJNYSJ/7iaPoZQnG
	 TpF5EL9aAjya7ru2A10PJPz4St/aO8m+vkmkUtbfmhN9xHqYuFuftsQXs7D58SyCNlh1c
	 VFa+Va80FWMwfuFjaOJ/ePJf/Qp04ae6WVEtg+bm/6l04tZAsQZ0N4oYlx6X4Qe04SeDX
	 mPVE/uS+08H+7GI5e1QpyJON6fkk65HEE4H7xbt36iip+Ro+qwHX8S0FyUmXArDFhkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398737;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PAEPNjYyMngFTeiX9BMkF4Btq8+JTWqJohWjD1HeigQ=;
	b=SjDJX82AFgTHhAdn/srnbt7krfqchFvAkOWaXS4ImDRscMkroZN/HmDsTJS53OuZKWWB
	 Xqs0ILlvxw2swasaeSjO4quBoQC7ldOwMoMogeU69ADtusJc7vwpAult6v/MTLneZJJSI
	 Y/qVMofHe2NgL6eDX2Q+4eP95eqaFpwZfSIg/tYmey2b0B4Tz6jKn1duX5sBz2KAUmzSc
	 Suv+L9GDXw7FtUrBPklAHsapcV6hlDoBQSOH3ASpZd+NBdE2QvsOrdjeXZPcfdpsTcyYV
	 8Vq80XoesU8PEdJc/YaB2VSbu8NU9Xo/EhuhMCnRWctS5X7jagpGx1c6GnMCszOeOSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIBEnZBV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012EC606A31C
	for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 22:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIBEnZBV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA981F000C1;
	Fri, 30 Oct 2026 22:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793398736;
	bh=PAEPNjYyMngFTeiX9BMkF4Btq8+JTWqJohWjD1HeigQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UIBEnZBVrXPphCwursCAE7KFBP0EOw8L9mjmRTziq33flqnFf62lV8uONHOPAFJCd
	 OIFfWA8qhaRs9hM+vaOgsdTcwvvqKWvyOr+tCFqiHHuqagb6aF/RirsjJFXL+B7t7O
	 jsZDBwXDxjgJQkENYYUGcNmVDlT4PySdX6cUXv+L+1aMUoNjF7pT8nW+q1bzpY/PvV
	 aTW+Y+sOeNH9yTEQb9pVjHt/I9Xh99D9r2XWtayriBoBEV+sHvQjg0N21n4j7VFGOW
	 sW7W9btnBwkkuEhTYQsMqeM4DDB9PM/chL9NESQqzdMkG1swYccm71ja25cVb/VYgg
	 106we+Vrb+B7A==
Message-ID: <sashiko-outbox-191572@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: trigger-netdev: add byte-rate threshold mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salah Ahmed" <haddad2inc@gmail.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261030215924.18060-1-haddad2inc@gmail.com>
References: <20261030215924.18060-1-haddad2inc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 22:18:56 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] leds: trigger-netdev: divide by zero in netdev_trig_work() when el=
apsed is 0
- [High] leds: trigger-netdev: set_baseline_state() skips stopping blink on=
 hw_control
- [High] leds: trigger-netdev: race in rate_threshold_store() due to missin=
g lock
- [Medium] leds: trigger-netdev: rate_threshold_store() polls while link is=
 down
- [Medium] leds: trigger-netdev: rate_smooth decay in netdev_trig_work() cl=
amps afterglow
- [Medium] leds: trigger-netdev: missing rate reset on link down in netdev_=
trig_notify()
- [Medium] leds: trigger-netdev: rate mode fails to stop hw blink in netdev=
_set_resting()
--

commit e9ed82389d653425379282a2ce97b71abb1b8c6e
Author: Salah Ahmed <haddad2inc@gmail.com>

leds: trigger-netdev: add byte-rate threshold mode

This patch adds a rate_threshold sysfs attribute to the netdev LED trigger =
so
that when non-zero, the LED blinks on a 50..150 ms ladder based on the
interface byte rate rather than per-packet counter updates, with smoothing
and a 20-second quadratic afterglow before returning to the baseline link
state.

> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> index 5b0132484594c..941cb13cdf04e 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c

[ ... ]

> @@ -79,97 +120,140 @@ struct led_netdev_data {
> =20
>  static const struct attribute_group netdev_trig_link_speed_attrs_group;
> =20
> -static void set_baseline_state(struct led_netdev_data *trigger_data)

[ ... ]

> -		if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &trigger_data->mode) &&
> -		    trigger_data->duplex =3D=3D DUPLEX_HALF)
> -			blink_on =3D true;
> +static void netdev_set_resting(struct led_netdev_data *trigger_data)
> +{
> +	struct led_classdev *led_cdev =3D trigger_data->led_cdev;
> =20
> -		if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &trigger_data->mode) &&
> -		    trigger_data->duplex =3D=3D DUPLEX_FULL)
> -			blink_on =3D true;
> +	if (trigger_data->carrier_link_up && netdev_baseline_on(trigger_data))
> +		led_set_brightness(led_cdev, led_cdev->blink_brightness);
> +	else
> +		led_set_brightness(led_cdev, LED_OFF);
> +}

[Severity: Medium]
When an LED driver implements the blink_set callback, will calling
led_stop_software_blink() followed by netdev_set_resting() actually stop
hardware blinking when the resting state is lit?

Unlike packet mode, which uses led_blink_set_oneshot() (which always uses
the software blink timer), rate mode in netdev_trig_work() calls
led_blink_set(), which invokes led_cdev->blink_set() and leaves LED_BLINK_SW
clear when hardware blinking is supported.

Per the blink_set contract in include/linux/leds.h, hardware blinking is
deactivated when the brightness is set to LED_OFF via brightness_set().
Because led_stop_software_blink() only stops the software timer and
netdev_set_resting() passes a non-zero led_cdev->blink_brightness directly =
to
led_set_brightness() when carrier_link_up and netdev_baseline_on() are true,
does hardware blinking remain active after traffic drops below threshold or
rate_threshold is cleared?

> -		if (blink_on)
> -			led_set_brightness(led_cdev,
> -					   led_cdev->blink_brightness);
> -		else
> -			led_set_brightness(led_cdev, LED_OFF);
> +static void set_baseline_state(struct led_netdev_data *trigger_data)
> +{
> +	int current_brightness;
> +	struct led_classdev *led_cdev =3D trigger_data->led_cdev;
> =20
> -		/* If we are looking for RX/TX start periodically
> -		 * checking stats
> +	/* Already validated, hw control is possible with the requested mode */
> +	if (trigger_data->hw_control) {
> +		led_cdev->hw_control_set(led_cdev, trigger_data->mode);
> +
> +		return;
> +	}
> +
> +	/* While a rate-mode software blink is still armed, the solid
> +	 * brightness below only lands in blink_brightness (LED_BLINK_SW),
> +	 * and the work re-arms the blink only on a ladder step change: with
> +	 * rate_last_ms cleared, a below-threshold sample computes the same
> +	 * zero step and the old blink keeps running. Stop it here; the work
> +	 * re-arms it from the measured rate, as rate_threshold_store() does.
> +	 */
> +	if (trigger_data->rate_threshold_kbps)
> +		led_stop_software_blink(led_cdev);

[Severity: High]
What happens if rate mode has armed a continuous software blink via
led_blink_set() while trigger_data->hw_control is false, and the trigger
subsequently transitions to trigger_data->hw_control =3D true via
netdev_led_attr_store() or netdev_trig_notify(NETDEV_UP)?

Because can_hw_control() does not check trigger_data->rate_threshold_kbps,
and set_baseline_state() returns early in the trigger_data->hw_control bran=
ch
before calling led_stop_software_blink(), won't led_cdev->blink_timer keep
firing and calling brightness_set(LED_OFF), overriding hardware control whi=
le
rate_threshold_store() rejects writes (including 0) with -EINVAL?

[ ... ]

> @@ -509,7 +594,51 @@ static ssize_t interval_store(struct device *dev,
>  	return size;
>  }
> =20
> +static ssize_t rate_threshold_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct led_netdev_data *trigger_data =3D led_trigger_get_drvdata(dev);
> +
> +	return sprintf(buf, "%lu\n", trigger_data->rate_threshold_kbps);
> +}
> +
> +static ssize_t rate_threshold_store(struct device *dev,
> +				    struct device_attribute *attr, const char *buf,
> +				    size_t size)
> +{
> +	struct led_netdev_data *trigger_data =3D led_trigger_get_drvdata(dev);
> +	unsigned long value;
> +	int ret;
> +
> +	if (trigger_data->hw_control)
> +		return -EINVAL;
> +
> +	ret =3D kstrtoul(buf, 0, &value);
> +	if (ret)
> +		return ret;
> +
> +	cancel_delayed_work_sync(&trigger_data->work);
> +
> +	trigger_data->rate_threshold_kbps =3D value;
> +	trigger_data->rate_last_ms =3D 0;
> +	netdev_trig_rate_reset(trigger_data);
> +
> +	/* Leaving rate mode has to undo the blink it armed: while a software
> +	 * blink is running led_set_brightness() only changes the blink
> +	 * brightness, and the packet mode below touches the LED only when the
> +	 * activity counter changes, so a link-only LED would keep blinking.
> +	 */
> +	led_stop_software_blink(trigger_data->led_cdev);
> +	set_baseline_state(trigger_data);	/* resets timer */
> +
> +	if (value)
> +		schedule_delayed_work(&trigger_data->work, 0);
> +
> +	return size;
> +}

[Severity: High]
Can rate_threshold_store() race with netdev_trig_notify() or
set_device_name() because it modifies rate state and schedules
trigger_data->work without holding trigger_data->lock?

In netdev_trig_notify() and set_device_name(), the caller cancels
trigger_data->work and then acquires trigger_data->lock before calling
dev_put(trigger_data->net_dev) and setting trigger_data->net_dev =3D NULL:

netdev_trig_notify()
  cancel_delayed_work_sync(&trigger_data->work);
  mutex_lock(&trigger_data->lock);
  ...
  case NETDEV_UNREGISTER:
    dev_put(trigger_data->net_dev);
    trigger_data->net_dev =3D NULL;

If rate_threshold_store() runs concurrently without trigger_data->lock and
schedules trigger_data->work, can netdev_trig_work() pass the initial
!trigger_data->net_dev check and then dereference a NULL or freed
trigger_data->net_dev in dev_get_stats(trigger_data->net_dev, &temp)?

Similarly, because netdev_trig_work() reads trigger_data->rate_threshold_kb=
ps
multiple times without synchronization, if rate_threshold_store() writes 0
while netdev_trig_work() is already in the rate-mode block, could the later
unsigned comparison

  if (rate >=3D trigger_data->rate_threshold_kbps)

see rate_threshold_kbps =3D=3D 0, evaluate to true for rate =3D=3D 0, and a=
rm a
150 ms blink after rate mode was disabled?

[Severity: Medium]
Also in rate_threshold_store(), set_baseline_state() already schedules
trigger_data->work when trigger_data->carrier_link_up is true and
trigger_data->rate_threshold_kbps is non-zero.

Why does rate_threshold_store() call schedule_delayed_work() a second time
unconditionally when value is non-zero? If carrier_link_up is false (while
trigger_data->net_dev is non-NULL), won't this start netdev_trig_work(),
which then re-arms itself every HZ / 2 and polls dev_get_stats() indefinite=
ly
while the link is down?

[ ... ]

> @@ -639,12 +769,14 @@ static int netdev_trig_notify(struct notifier_block=
 *nb,
>  		dev_put(trigger_data->net_dev);
>  		dev_hold(dev);
>  		trigger_data->net_dev =3D dev;
> +		netdev_trig_rate_reset(trigger_data);
>  		if (evt =3D=3D NETDEV_CHANGENAME)
>  			get_device_state(trigger_data);
>  		break;
>  	case NETDEV_UNREGISTER:
>  		dev_put(trigger_data->net_dev);
>  		trigger_data->net_dev =3D NULL;
> +		netdev_trig_rate_reset(trigger_data);
>  		break;
>  	case NETDEV_UP:
>  		trigger_data->hw_control =3D can_hw_control(trigger_data);

[Severity: Medium]
Should netdev_trig_notify() also call netdev_trig_rate_reset() on NETDEV_DO=
WN
or when carrier_link_up becomes false on NETDEV_CHANGE (and should
set_baseline_state() reset rate_ag and rate_peak when zeroing rate_last_ms)?

Right now, if the carrier drops during active traffic or mid-afterglow, the
work is cancelled while rate_smooth, rate_peak, rate_ag, and rate_valid
remain frozen at their pre-down values. When the link comes back up later
with no traffic, won't netdev_trig_work() resume decaying those stale values
and blink the idle LED for up to 20 seconds?

> @@ -674,6 +806,8 @@ static void netdev_trig_work(struct work_struct *work)
>  	unsigned int new_activity;
>  	struct rtnl_link_stats64 temp;
>  	unsigned long interval;
> +	unsigned long now, ms, elapsed, stale;
> +	u64 bytes;
>  	int invert;
> =20
>  	/* If we dont have a device, insure we are off */
> @@ -682,6 +816,153 @@ static void netdev_trig_work(struct work_struct *wo=
rk)
>  		return;
>  	}
> =20
> +	/* Rate mode: blink on a ladder driven by the interface byte rate inste=
ad
> +	 * of per packet. Independent of the packet-mode bits so that interfaces
> +	 * whose packet counters are blind to hardware-forwarded traffic still
> +	 * show activity, and so that a sub-threshold link rests in its baseline
> +	 * state (solid with a link bit, dark without one).
> +	 *
> +	 * The rate is measured over the interval between two observed counter
> +	 * changes, not over a fixed window. Counters that are refreshed in
> +	 * bursts - a cached switch MIB polled every few seconds, for instance -
> +	 * dump their whole accumulation into the first fixed window that follo=
ws
> +	 * the refresh, which reports a rate several times too high and then
> +	 * zero until the next refresh. Measuring between changes makes the
> +	 * trigger independent of how often the driver refreshes its counters,
> +	 * and keeps the blink running for as long as the traffic does.
> +	 */
> +	if (trigger_data->rate_threshold_kbps && !trigger_data->hw_control) {
> +		dev_stats =3D dev_get_stats(trigger_data->net_dev, &temp);
> +		bytes =3D dev_stats->rx_bytes + dev_stats->tx_bytes;
> +		now =3D jiffies;
> +
> +		if (!trigger_data->rate_valid) {
> +			trigger_data->rate_bytes =3D bytes;
> +			trigger_data->rate_jiffies =3D now;
> +			trigger_data->rate_interval =3D HZ;
> +			trigger_data->rate_valid =3D true;
> +		} else if (bytes !=3D trigger_data->rate_bytes) {
> +			if (bytes > trigger_data->rate_bytes) {
> +				trigger_data->rate_interval =3D
> +					now - trigger_data->rate_jiffies;
> +				elapsed =3D jiffies_to_msecs(trigger_data->rate_interval);
> +				if (elapsed > NETDEV_RATE_MAX_ELAPSED_MS)
> +					elapsed =3D NETDEV_RATE_MAX_ELAPSED_MS;
> +				trigger_data->rate_kbps =3D
> +					div_u64((bytes - trigger_data->rate_bytes) * 1000,
> +						elapsed * 1024);
> +			} else {

[Severity: High]
Can elapsed be 0 here and cause a divide-by-zero in div_u64()?

If netdev_trig_work() runs twice within the same jiffy (now =3D=3D
trigger_data->rate_jiffies) while traffic is incrementing rx_bytes or
tx_bytes, trigger_data->rate_interval is 0 and jiffies_to_msecs(0) returns =
0.

This can happen when set_baseline_state() reschedules trigger_data->work wi=
th
delay 0 (for example, on a mode or interval sysfs write, a NETDEV_CHANGE
notification, or in rate_threshold_store() where schedule_delayed_work() is
called twice with delay 0) without resetting rate_valid. Since elapsed is
only clamped from above against NETDEV_RATE_MAX_ELAPSED_MS, passing
elapsed * 1024 to div_u64() will divide by zero.

> +				/* Counters went backwards (reset or wrapped):
> +				 * re-anchor instead of reporting a huge rate.
> +				 */
> +				trigger_data->rate_kbps =3D 0;
> +			}
> +			trigger_data->rate_bytes =3D bytes;
> +			trigger_data->rate_jiffies =3D now;
> +		} else {
> +			/* No change: keep the last measured rate for as long as
> +			 * the counter keeps being refreshed, then fall back to
> +			 * the link state.
> +			 */
> +			stale =3D trigger_data->rate_interval * NETDEV_RATE_STALE_MULT;
> +			if (stale > NETDEV_RATE_STALE_MAX)
> +				stale =3D NETDEV_RATE_STALE_MAX;
> +			if (time_after(now, trigger_data->rate_jiffies + stale))
> +				trigger_data->rate_kbps =3D 0;
> +		}
> +
> +		/* Smoothing ported from the userspace daemon this replaces: attack
> +		 * immediately at or above the threshold so the first evaluation of
> +		 * a transfer already blinks, rise slowly and release quickly below
> +		 * it so the ladder step does not chatter when a bursty rate
> +		 * straddles a boundary.
> +		 */
> +		if (trigger_data->rate_kbps >=3D trigger_data->rate_threshold_kbps)
> +			trigger_data->rate_smooth =3D trigger_data->rate_kbps;
> +		else if (trigger_data->rate_kbps < trigger_data->rate_smooth)
> +			trigger_data->rate_smooth =3D (trigger_data->rate_smooth +
> +				3 * trigger_data->rate_kbps) / 4;
> +		else
> +			trigger_data->rate_smooth =3D (3 * trigger_data->rate_smooth +
> +				trigger_data->rate_kbps) / 4;
> +
> +		if (trigger_data->rate_smooth >=3D trigger_data->rate_threshold_kbps) {
> +			if (trigger_data->rate_smooth > trigger_data->rate_peak)
> +				trigger_data->rate_peak =3D trigger_data->rate_smooth;
> +			trigger_data->rate_ag =3D 0;
> +		}
> +
> +		ms =3D 0;
> +		if (trigger_data->carrier_link_up) {
> +			unsigned long rate =3D trigger_data->rate_smooth;
> +
> +			/* Quadratic afterglow from the last peak: the synthetic rate
> +			 * decays as peak * remaining^2 / window^2 over
> +			 * NETDEV_RATE_AFTERGLOW, then the LED returns to the link
> +			 * state. div_u64() keeps 32-bit builds linking.
> +			 */
> +			if (rate < trigger_data->rate_threshold_kbps &&
> +			    trigger_data->rate_peak >=3D trigger_data->rate_threshold_kbps &&
> +			    trigger_data->rate_ag < NETDEV_RATE_AFTERGLOW) {
> +				unsigned long rem;
> +
> +				trigger_data->rate_ag +=3D HZ / 2;
> +				rem =3D NETDEV_RATE_AFTERGLOW - trigger_data->rate_ag;
> +				rate =3D div_u64((u64)trigger_data->rate_peak * rem * rem,
> +					       NETDEV_RATE_AFTERGLOW *
> +							NETDEV_RATE_AFTERGLOW);
> +			}
> +
> +			if (rate >=3D trigger_data->rate_threshold_kbps) {
> +				if (rate >=3D 4096)
> +					ms =3D 50;
> +				else if (rate >=3D 1024)
> +					ms =3D 60;
> +				else if (rate >=3D 256)
> +					ms =3D 80;
> +				else if (rate >=3D 32)
> +					ms =3D 100;
> +				else
> +					ms =3D 150;
> +			}
> +
> +			/* During the fade the step only ever gets longer: re-arming
> +			 * a faster blink mid-decay looks like stutter.
> +			 */
> +			if (ms && trigger_data->rate_ag &&
> +			    ms < trigger_data->rate_last_ms)
> +				ms =3D trigger_data->rate_last_ms;
> +		}

[Severity: Medium]
Does the quick-release decay of rate_smooth prevent the quadratic afterglow
from stepping down the ladder from rate_peak?

When traffic stops and rate_kbps drops to 0, rate_smooth is divided by 4 on
each tick while remaining >=3D rate_threshold_kbps for one or more ticks. On
those ticks, rate_ag stays 0 and trigger_data->rate_last_ms walks down to
slower ladder steps (for instance, 150 ms when rate_threshold_kbps <=3D 31).

Once rate_smooth finally falls below rate_threshold_kbps and the quadratic
afterglow computes a synthetic rate near rate_peak, won't the check

  if (ms && trigger_data->rate_ag &&
      ms < trigger_data->rate_last_ms)
          ms =3D trigger_data->rate_last_ms;

clamp ms to that slowest step for the entire 20-second afterglow window
instead of fading down from the peak blink rate?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030215924.1806=
0-1-haddad2inc@gmail.com?part=3D1
