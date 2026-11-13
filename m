Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573117;
	b=bC7deOVBtLJXJmxUaJhA7VkHjTEQNsbtfZE5MtJDowIiyOeRZPMh5Qe2T+Fpwl3m9U8i
	 vx1SavfApDRaN1DBNLE6qG2Q3SSqxbiSzZoRqshg6VBT5oE59iOtdsKo1OOQEIl7Rz0vp
	 u61ZvZ+HQkNW+uXQVlQ8uXgBSK77o/e5Zkr4ac0Dtjjohh32IbArJ1ItcKd+Q+5bj6Xmg
	 PU378qSWG6JQbXrjAH5llGgBlsJrul2dyZBmedGET972sj7Djh14zL1PthPCYUCIYHLFq
	 WJDS5UeofuzZxGxmSEt3mglIrxC9Ojbc1Lh8PVtqAxq5uFUHJo371elviN4Jr727clA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573117;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=4ssciRH88VDdkvm7TV6PkcMZybMVmsMqyMEHjtnUcT0=;
	b=HgaZQ/osQDYtjF1g1gKH9H+mwslYKGf9+BB7Tu1tbK65yqihW7H9r32kNOL/bj2jdEXe
	 ZAhuU/xJ7mJpJPxaCVHu1/HosPtnl3RRqW+RzCrNx7wyz15RJFN3gweCrNNwWdS7S6p0D
	 Fnav1Py5Tv75r/MBHfBBUgqq6s0D6L8P6zYxAm+sbYfYHZI/NVoorQcrT2UAk2R2+Q76q
	 jQNh6mJVP0gPqtwVXduOQ+i3j0TwN1DsAJIppMPogHYJQtRMisLCG1dvis2XcvALZpPxc
	 WiTL/L7Ukn1/CTMMCBVkQAF3cYIVh31NXbATTSYZe3zqsc2BLpCQ6Uzv3k0X4cOJRBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7ZXG4Qf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4129B606A337;
	Fri, 13 Nov 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7ZXG4Qf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0893E1F000C4;
	Fri, 13 Nov 2026 12:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794573116;
	bh=4ssciRH88VDdkvm7TV6PkcMZybMVmsMqyMEHjtnUcT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B7ZXG4QfHqbbjs1CJ8HLfTDpDP8j6iP7oWHOb7EbsX1yEp1dhOWHYzIX2jivCOk+1
	 foP3LVT6vkuMV6/p3ez+NiVUuDd3nDLzeLurhE8MG3Xj/CvCOqn34Zcw/eaW1dhqd7
	 ntpvktmZVM66hNjXnyDhC28riMOFigvJW45f1yO8jgB4EEMaMGr3KoXTX8NGISBkId
	 ia+yPDDf9Tow1URCqJ+cGlVMWRryMNb03M0sruSxS4z8BCEiTJyPkTau7/KqEh+Zab
	 e5TEIsVhWS/hEa8RniegZ9CUnjyjWlXC0pro/SeFnKA2J35cYgD8K8veXOoR+H3bKa
	 3orKd0SBKAVqQ==
Date: Fri, 13 Nov 2026 12:31:52 +0000
From: Lee Jones <lee@kernel.org>
To: Salah Ahmed <haddad2inc@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Peng Fan <peng.fan@nxp.com>, Rosen Penev <rosenp@gmail.com>,
	Rong Zhang <i@rong.moe>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger-netdev: add byte-rate threshold mode
Message-ID: <179370046939.793788.505185499377646992@kernel.org>
References: <20261030215924.18060-1-haddad2inc@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030215924.18060-1-haddad2inc@gmail.com>
X-AI-Review-Draft: <20261030215924.18060-1-haddad2inc@gmail.com>

On Sat, 31 Oct 2026, Salah Ahmed wrote:

Please review, explain or fix the Sashiko review(s).

> The tx/rx modes blink once per observed change of the packet counters,
> which misses traffic forwarded in hardware (DSA bridge offload) and
> flickers on background broadcast noise. Add a rate_threshold attribute
> (KiB/s): when non-zero the trigger drives the LED from the interface byte
> rate instead, blinking on a 50..150 ms ladder above the threshold and
> resting in the baseline state (solid on link, dark without carrier) below
> it.
>
> The rate is measured over the interval between two observed counter
> changes, not over a fixed window. Drivers that refresh their counters in
> bursts - a cached switch MIB polled every few seconds, for instance -
> would otherwise dump a whole accumulation period into the first fixed
> window that follows the refresh: the reported rate is then several times
> the real one, followed by zero until the next refresh, which turns the LED
> into a stutter instead of a steady blink. Measuring between changes makes
> the trigger independent of the driver's refresh interval, and the last
> measured rate is kept until the counter has been silent for twice the
> interval it was measured over (capped at 10 s) so that the blink lasts as
> long as the traffic does.
>
> The blink is re-armed only when the ladder step changes: led_blink_set()
> restarts the software blink timer and truncates the phase in progress, so
> re-arming it on every evaluation shows up as an irregular cadence.
>
> Rate mode is independent of the link/tx/rx mode bits on purpose, so that
> ports whose packet counters are blind to offloaded flows still show
> activity. It yields to hw_control, and writing 0 restores the link state
> even for an LED with no tx/rx bit set, because the packet path only touches
> the LED when the activity counter changes.
>
> Byte counters can legitimately go backwards when a driver resets them, and
> an unsigned subtraction would then report an enormous rate, so a decreasing
> counter re-anchors the measurement instead. div_u64() keeps 32-bit
> architectures linking without __udivdi3/__aeabi_uldivmod.
>
> Bursty transfers can straddle a ladder boundary on every evaluation,
> and cutting the blink off the instant the counter goes quiet makes a
> pausing transfer look like the LED died. The measured rate is therefore
> smoothed the way field-accepted userspace activity daemons do it -
> immediate attack at or above the threshold, a slow rise and a quick
> release below it - and when the counter goes silent the blink fades out
> quadratically from the last peak over 20 s, with the ladder step only
> ever slowing during the fade.
>
> set_baseline_state() runs after every netdev notifier event and after
> every mode or device_name write, and both callers cancel the work first.
> It sets a solid brightness and cancels the work first, so with a rate
> threshold set it also owns the rate-mode bookkeeping: clear the armed
> ladder step, stop a software blink that is still armed (while it runs, a
> solid brightness set here only lands in blink_brightness), and reschedule
> the work. Rescheduling is what keeps rate mode alive on a link-only LED
> across carrier changes and honest on tx/rx LEDs under load: without it the
> work computes the same ladder step as before, skips the re-arm while the
> brightness has just been reset to solid, and a below-threshold sample
> after a cleared rate_last_ms leaves an old blink running.
>
> The state a rate-mode blink rests in is the trigger's baseline state, not
> a second policy: netdev_baseline_on() answers "is this LED on at rest?"
> from the same link, speed and duplex mode bits the baseline uses, and
> netdev_set_resting() applies the same level, blink_brightness. Both
> set_baseline_state() and the post-blink path call it, so the two cannot
> drift apart: a mode without a link bit rests dark, and a multi-level LED
> rests at its blinking level rather than at LED_ON (1), which would read
> nearly dark. On a single-level LED (max_brightness = 1) the two values
> coincide, so nothing differs there.
>
> Signed-off-by: Salah Ahmed <haddad2inc@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 417 +++++++++++++++++++++-----
>  1 file changed, 349 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 5b01324845..941cb13cdf 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -20,6 +20,7 @@
>  #include <linux/leds.h>
>  #include <linux/linkmode.h>
>  #include <linux/list.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
>  #include <linux/mutex.h>
> @@ -31,6 +32,21 @@
>
>  #define NETDEV_LED_DEFAULT_INTERVAL	50
>
> +/* Rate mode: a measured rate is kept for two counter refresh intervals before
> + * it counts as stale, capped so that a dead link cannot blink for long.
> + * NETDEV_RATE_MAX_ELAPSED_MS keeps the u32 divisor of div_u64() in range.
> + */

Incorrect multi-line comment format for LEDs.

> +#define NETDEV_RATE_STALE_MULT		2
> +#define NETDEV_RATE_STALE_MAX		(10 * HZ)
> +#define NETDEV_RATE_MAX_ELAPSED_MS	1000000
> +
> +/* Afterglow: when the counter goes quiet the blink does not cut off at once;
> + * the last measured peak fades out quadratically over this window, mirroring
> + * the decay shape of the userspace activity daemons this mode replaces in the
> + * field, so a transfer that pauses briefly does not look like the LED died.
> + */
> +#define NETDEV_RATE_AFTERGLOW		(20 * HZ)
> +
>  /*
>   * Configurable sysfs attributes:
>   *
> @@ -42,6 +58,14 @@
>   * rx -  LED blinks on receive data
>   * tx_err -  LED blinks on transmit error
>   * rx_err -  LED blinks on receive error
> + * rate_threshold - KiB/s; when non-zero the trigger blinks according to
> + *         the interface byte rate (ladder 50..150 ms) instead of per-packet,
> + *         resting in the baseline (link) state below the threshold.
> + *         Byte-rate mode sees traffic that packet counters miss once the
> + *         driver reports wire bytes in its stats (e.g. cached switch MIB on
> + *         DSA ports). The rate is measured between two counter updates
> + *         rather than over a fixed window, so counters that are refreshed
> + *         in bursts report their true average rate.
>   *
>   * Note: If the user selects a mode that is not supported by hw, default
>   * behavior is to fall back to software control of the LED. However not every
> @@ -68,6 +92,23 @@ struct led_netdev_data {
>  	atomic_t interval;
>  	unsigned int last_activity;
>
> +	/* Rate mode state: rate_bytes/rate_jiffies anchor the last observed
> +	 * counter change, rate_interval is the time that produced it,
> +	 * rate_kbps the rate measured over that interval, and rate_last_ms the
> +	 * blink period currently armed (0 = solid). rate_threshold_kbps is the
> +	 * threshold in KiB/s, 0 = rate mode disabled.
> +	 */
> +	u64 rate_bytes;
> +	unsigned long rate_jiffies;
> +	unsigned long rate_interval;
> +	unsigned long rate_kbps;
> +	unsigned long rate_last_ms;
> +	unsigned long rate_threshold_kbps;
> +	unsigned long rate_smooth;
> +	unsigned long rate_peak;
> +	unsigned long rate_ag;
> +	bool rate_valid;
> +
>  	unsigned long mode;
>  	int link_speed;
>  	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_link_modes);
> @@ -79,6 +120,80 @@ struct led_netdev_data {
>
>  static const struct attribute_group netdev_trig_link_speed_attrs_group;
>
> +/*
> + * The resting (non-blinking) state of a netdev LED. The link and duplex
> + * mode bits decide whether it is lit at all, and the level it is lit at is
> + * blink_brightness rather than LED_ON, so that a multi-level LED is not
> + * dimmed to its lowest step and a tx/rx-only LED is not left solid once the
> + * traffic stops. Both the baseline path and the rate-mode path that returns
> + * the LED to rest after a blink use this, so they cannot drift apart.
> + */
> +static bool netdev_baseline_on(struct led_netdev_data *trigger_data)
> +{
> +	if (test_bit(TRIGGER_NETDEV_LINK, &trigger_data->mode))
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_10, &trigger_data->mode) &&
> +	    trigger_data->link_speed == SPEED_10)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_100, &trigger_data->mode) &&
> +	    trigger_data->link_speed == SPEED_100)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_1000, &trigger_data->mode) &&
> +	    trigger_data->link_speed == SPEED_1000)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_2500, &trigger_data->mode) &&
> +	    trigger_data->link_speed == SPEED_2500)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_5000, &trigger_data->mode) &&
> +	    trigger_data->link_speed == SPEED_5000)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_10000, &trigger_data->mode) &&
> +	    trigger_data->link_speed == SPEED_10000)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_25000, &trigger_data->mode) &&
> +	    trigger_data->link_speed == SPEED_25000)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_40000, &trigger_data->mode) &&
> +	    trigger_data->link_speed == SPEED_40000)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_50000, &trigger_data->mode) &&
> +	    trigger_data->link_speed == SPEED_50000)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_100000, &trigger_data->mode) &&
> +	    trigger_data->link_speed == SPEED_100000)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &trigger_data->mode) &&
> +	    trigger_data->duplex == DUPLEX_HALF)
> +		return true;
> +
> +	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &trigger_data->mode) &&
> +	    trigger_data->duplex == DUPLEX_FULL)
> +		return true;
> +
> +	return false;
> +}
> +
> +static void netdev_set_resting(struct led_netdev_data *trigger_data)
> +{
> +	struct led_classdev *led_cdev = trigger_data->led_cdev;
> +
> +	if (trigger_data->carrier_link_up && netdev_baseline_on(trigger_data))
> +		led_set_brightness(led_cdev, led_cdev->blink_brightness);
> +	else
> +		led_set_brightness(led_cdev, LED_OFF);
> +}
> +
>  static void set_baseline_state(struct led_netdev_data *trigger_data)
>  {
>  	int current_brightness;
> @@ -91,85 +206,54 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
>  		return;
>  	}
>
> +	/* While a rate-mode software blink is still armed, the solid
> +	 * brightness below only lands in blink_brightness (LED_BLINK_SW),
> +	 * and the work re-arms the blink only on a ladder step change: with
> +	 * rate_last_ms cleared, a below-threshold sample computes the same
> +	 * zero step and the old blink keeps running. Stop it here; the work
> +	 * re-arms it from the measured rate, as rate_threshold_store() does.
> +	 */
> +	if (trigger_data->rate_threshold_kbps)
> +		led_stop_software_blink(led_cdev);
> +
>  	current_brightness = led_cdev->brightness;
>  	if (current_brightness)
>  		led_cdev->blink_brightness = current_brightness;
>  	if (!led_cdev->blink_brightness)
>  		led_cdev->blink_brightness = led_cdev->max_brightness;
>
> -	if (!trigger_data->carrier_link_up) {
> -		led_set_brightness(led_cdev, LED_OFF);
> -	} else {
> -		bool blink_on = false;
> +	netdev_set_resting(trigger_data);
>
> -		if (test_bit(TRIGGER_NETDEV_LINK, &trigger_data->mode))
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_LINK_10, &trigger_data->mode) &&
> -		    trigger_data->link_speed == SPEED_10)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_LINK_100, &trigger_data->mode) &&
> -		    trigger_data->link_speed == SPEED_100)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_LINK_1000, &trigger_data->mode) &&
> -		    trigger_data->link_speed == SPEED_1000)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_LINK_2500, &trigger_data->mode) &&
> -		    trigger_data->link_speed == SPEED_2500)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_LINK_5000, &trigger_data->mode) &&
> -		    trigger_data->link_speed == SPEED_5000)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_LINK_10000, &trigger_data->mode) &&
> -		    trigger_data->link_speed == SPEED_10000)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_LINK_25000, &trigger_data->mode) &&
> -		    trigger_data->link_speed == SPEED_25000)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_LINK_40000, &trigger_data->mode) &&
> -		    trigger_data->link_speed == SPEED_40000)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_LINK_50000, &trigger_data->mode) &&
> -		    trigger_data->link_speed == SPEED_50000)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_LINK_100000, &trigger_data->mode) &&
> -		    trigger_data->link_speed == SPEED_100000)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &trigger_data->mode) &&
> -		    trigger_data->duplex == DUPLEX_HALF)
> -			blink_on = true;
> -
> -		if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &trigger_data->mode) &&
> -		    trigger_data->duplex == DUPLEX_FULL)
> -			blink_on = true;
> -
> -		if (blink_on)
> -			led_set_brightness(led_cdev,
> -					   led_cdev->blink_brightness);
> -		else
> -			led_set_brightness(led_cdev, LED_OFF);
> -
> -		/* If we are looking for RX/TX start periodically
> -		 * checking stats
> +	/* If we are looking for RX/TX (or a rate threshold is set) start
> +	 * periodically checking stats
> +	 */
> +	if (trigger_data->carrier_link_up &&
> +	    (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
> +	     test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ||
> +	     test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ||
> +	     test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode) ||
> +	     trigger_data->rate_threshold_kbps)) {
> +		/* Rate mode re-arms the blink only when the ladder step
> +		 * changes, and the brightness has just been set to a solid
> +		 * state, so forget the step that was armed before this.
>  		 */
> -		if (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
> -		    test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ||
> -		    test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ||
> -		    test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode))
> -			schedule_delayed_work(&trigger_data->work, 0);
> +		trigger_data->rate_last_ms = 0;
> +		schedule_delayed_work(&trigger_data->work, 0);
>  	}
>  }
>
> +/* Drop the measured rate whenever the counter source changes, so that the
> + * next sample re-anchors instead of subtracting counters of two interfaces.
> + */
> +static void netdev_trig_rate_reset(struct led_netdev_data *trigger_data)
> +{
> +	trigger_data->rate_valid = false;
> +	trigger_data->rate_kbps = 0;
> +	trigger_data->rate_smooth = 0;
> +	trigger_data->rate_peak = 0;
> +	trigger_data->rate_ag = 0;
> +}
> +
>  static bool supports_hw_control(struct led_classdev *led_cdev)
>  {
>  	if (!led_cdev->hw_control_get || !led_cdev->hw_control_set ||
> @@ -311,6 +395,7 @@ static int set_device_name(struct led_netdev_data *trigger_data,
>  		get_device_state(trigger_data);
>
>  	trigger_data->last_activity = 0;
> +	netdev_trig_rate_reset(trigger_data);
>
>  	/* Skip if we're called from netdev_trig_activate() and hw_control is true */
>  	if (!trigger_data->hw_control || led_get_trigger_data(trigger_data->led_cdev))
> @@ -509,7 +594,51 @@ static ssize_t interval_store(struct device *dev,
>  	return size;
>  }
>
> +static ssize_t rate_threshold_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
> +
> +	return sprintf(buf, "%lu\n", trigger_data->rate_threshold_kbps);

sysfs_emit()

> +}
> +
> +static ssize_t rate_threshold_store(struct device *dev,
> +				    struct device_attribute *attr, const char *buf,
> +				    size_t size)
> +{
> +	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
> +	unsigned long value;
> +	int ret;
> +
> +	if (trigger_data->hw_control)
> +		return -EINVAL;
> +
> +	ret = kstrtoul(buf, 0, &value);
> +	if (ret)
> +		return ret;
> +
> +	cancel_delayed_work_sync(&trigger_data->work);
> +
> +	trigger_data->rate_threshold_kbps = value;
> +	trigger_data->rate_last_ms = 0;
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
> +
>  static DEVICE_ATTR_RW(interval);
> +static DEVICE_ATTR_RW(rate_threshold);
>
>  static ssize_t offloaded_show(struct device *dev,
>  			      struct device_attribute *attr, char *buf)
> @@ -593,6 +722,7 @@ static struct attribute *netdev_trig_attrs[] = {
>  	&dev_attr_rx_err.attr,
>  	&dev_attr_tx_err.attr,
>  	&dev_attr_interval.attr,
> +	&dev_attr_rate_threshold.attr,

Is this documented?

Thinking about it, do we even want a whole new rate-smoothing,
ladder-stepping and quadratic-afterglow engine living in ledtrig-netdev?
If you already have a userspace daemon doing this, why can't it stay in
userspace?

>  	&dev_attr_offloaded.attr,
>  	NULL
>  };
> @@ -639,12 +769,14 @@ static int netdev_trig_notify(struct notifier_block *nb,
>  		dev_put(trigger_data->net_dev);
>  		dev_hold(dev);
>  		trigger_data->net_dev = dev;
> +		netdev_trig_rate_reset(trigger_data);
>  		if (evt == NETDEV_CHANGENAME)
>  			get_device_state(trigger_data);
>  		break;
>  	case NETDEV_UNREGISTER:
>  		dev_put(trigger_data->net_dev);
>  		trigger_data->net_dev = NULL;
> +		netdev_trig_rate_reset(trigger_data);
>  		break;
>  	case NETDEV_UP:
>  		trigger_data->hw_control = can_hw_control(trigger_data);
> @@ -674,6 +806,8 @@ static void netdev_trig_work(struct work_struct *work)
>  	unsigned int new_activity;
>  	struct rtnl_link_stats64 temp;
>  	unsigned long interval;
> +	unsigned long now, ms, elapsed, stale;
> +	u64 bytes;
>  	int invert;
>
>  	/* If we dont have a device, insure we are off */
> @@ -682,6 +816,153 @@ static void netdev_trig_work(struct work_struct *work)
>  		return;
>  	}
>
> +	/* Rate mode: blink on a ladder driven by the interface byte rate instead
> +	 * of per packet. Independent of the packet-mode bits so that interfaces
> +	 * whose packet counters are blind to hardware-forwarded traffic still
> +	 * show activity, and so that a sub-threshold link rests in its baseline
> +	 * state (solid with a link bit, dark without one).
> +	 *
> +	 * The rate is measured over the interval between two observed counter
> +	 * changes, not over a fixed window. Counters that are refreshed in
> +	 * bursts - a cached switch MIB polled every few seconds, for instance -
> +	 * dump their whole accumulation into the first fixed window that follows
> +	 * the refresh, which reports a rate several times too high and then
> +	 * zero until the next refresh. Measuring between changes makes the
> +	 * trigger independent of how often the driver refreshes its counters,
> +	 * and keeps the blink running for as long as the traffic does.
> +	 */
> +	if (trigger_data->rate_threshold_kbps && !trigger_data->hw_control) {
> +		dev_stats = dev_get_stats(trigger_data->net_dev, &temp);
> +		bytes = dev_stats->rx_bytes + dev_stats->tx_bytes;
> +		now = jiffies;
> +
> +		if (!trigger_data->rate_valid) {
> +			trigger_data->rate_bytes = bytes;
> +			trigger_data->rate_jiffies = now;
> +			trigger_data->rate_interval = HZ;
> +			trigger_data->rate_valid = true;
> +		} else if (bytes != trigger_data->rate_bytes) {
> +			if (bytes > trigger_data->rate_bytes) {
> +				trigger_data->rate_interval =
> +					now - trigger_data->rate_jiffies;
> +				elapsed = jiffies_to_msecs(trigger_data->rate_interval);
> +				if (elapsed > NETDEV_RATE_MAX_ELAPSED_MS)
> +					elapsed = NETDEV_RATE_MAX_ELAPSED_MS;
> +				trigger_data->rate_kbps =
> +					div_u64((bytes - trigger_data->rate_bytes) * 1000,
> +						elapsed * 1024);
> +			} else {
> +				/* Counters went backwards (reset or wrapped):
> +				 * re-anchor instead of reporting a huge rate.
> +				 */
> +				trigger_data->rate_kbps = 0;
> +			}
> +			trigger_data->rate_bytes = bytes;
> +			trigger_data->rate_jiffies = now;
> +		} else {
> +			/* No change: keep the last measured rate for as long as
> +			 * the counter keeps being refreshed, then fall back to
> +			 * the link state.
> +			 */
> +			stale = trigger_data->rate_interval * NETDEV_RATE_STALE_MULT;
> +			if (stale > NETDEV_RATE_STALE_MAX)
> +				stale = NETDEV_RATE_STALE_MAX;
> +			if (time_after(now, trigger_data->rate_jiffies + stale))
> +				trigger_data->rate_kbps = 0;
> +		}
> +
> +		/* Smoothing ported from the userspace daemon this replaces: attack
> +		 * immediately at or above the threshold so the first evaluation of
> +		 * a transfer already blinks, rise slowly and release quickly below
> +		 * it so the ladder step does not chatter when a bursty rate
> +		 * straddles a boundary.
> +		 */
> +		if (trigger_data->rate_kbps >= trigger_data->rate_threshold_kbps)
> +			trigger_data->rate_smooth = trigger_data->rate_kbps;
> +		else if (trigger_data->rate_kbps < trigger_data->rate_smooth)
> +			trigger_data->rate_smooth = (trigger_data->rate_smooth +
> +				3 * trigger_data->rate_kbps) / 4;
> +		else
> +			trigger_data->rate_smooth = (3 * trigger_data->rate_smooth +
> +				trigger_data->rate_kbps) / 4;
> +
> +		if (trigger_data->rate_smooth >= trigger_data->rate_threshold_kbps) {
> +			if (trigger_data->rate_smooth > trigger_data->rate_peak)
> +				trigger_data->rate_peak = trigger_data->rate_smooth;
> +			trigger_data->rate_ag = 0;
> +		}
> +
> +		ms = 0;
> +		if (trigger_data->carrier_link_up) {
> +			unsigned long rate = trigger_data->rate_smooth;
> +
> +			/* Quadratic afterglow from the last peak: the synthetic rate
> +			 * decays as peak * remaining^2 / window^2 over
> +			 * NETDEV_RATE_AFTERGLOW, then the LED returns to the link
> +			 * state. div_u64() keeps 32-bit builds linking.
> +			 */
> +			if (rate < trigger_data->rate_threshold_kbps &&
> +			    trigger_data->rate_peak >= trigger_data->rate_threshold_kbps &&
> +			    trigger_data->rate_ag < NETDEV_RATE_AFTERGLOW) {
> +				unsigned long rem;
> +
> +				trigger_data->rate_ag += HZ / 2;
> +				rem = NETDEV_RATE_AFTERGLOW - trigger_data->rate_ag;
> +				rate = div_u64((u64)trigger_data->rate_peak * rem * rem,
> +					       NETDEV_RATE_AFTERGLOW *
> +							NETDEV_RATE_AFTERGLOW);
> +			}
> +
> +			if (rate >= trigger_data->rate_threshold_kbps) {
> +				if (rate >= 4096)
> +					ms = 50;
> +				else if (rate >= 1024)
> +					ms = 60;
> +				else if (rate >= 256)
> +					ms = 80;
> +				else if (rate >= 32)
> +					ms = 100;
> +				else
> +					ms = 150;
> +			}

Where do all these magic numbers come from?  Can they be defined, or,
again is this policy better kept out of the kernel entirely?

> +
> +			/* During the fade the step only ever gets longer: re-arming
> +			 * a faster blink mid-decay looks like stutter.
> +			 */
> +			if (ms && trigger_data->rate_ag &&
> +			    ms < trigger_data->rate_last_ms)
> +				ms = trigger_data->rate_last_ms;
> +		}
> +
> +		if (!ms) {
> +			trigger_data->rate_peak = 0;
> +			trigger_data->rate_ag = 0;
> +		}
> +
> +		/* Re-arm only when the blink period actually changes: every
> +		 * led_blink_set() restarts the software blink and truncates the
> +		 * phase in progress, which shows up as an irregular cadence.
> +		 */
> +		if (ms != trigger_data->rate_last_ms) {
> +			led_stop_software_blink(trigger_data->led_cdev);
> +			if (ms) {
> +				unsigned long delay_on = ms, delay_off = ms;
> +
> +				led_blink_set(trigger_data->led_cdev, &delay_on,
> +					      &delay_off);
> +			} else {
> +				/* Resting state == the baseline state: same mode bits,
> +				 * same brightness level (see netdev_set_resting()).
> +				 */
> +				netdev_set_resting(trigger_data);
> +			}
> +			trigger_data->rate_last_ms = ms;
> +		}
> +
> +		schedule_delayed_work(&trigger_data->work, HZ / 2);
> +		return;
> +	}
> +
>  	/* If we are not looking for RX/TX then return  */
>  	if (!test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) &&
>  	    !test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) &&
> -- 
> 2.53.0
>
>

-- 
Lee Jones
