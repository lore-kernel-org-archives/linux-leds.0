Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AFE47F3B3
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 14:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395679; cv=none; b=r8SIJA3qyTIhXSxOfJRXxydHOfP7JY7dojTePMswWgGdWs4/a4FTabdhKueQQZv4CVNforrKgZu37n86SXttfxs5Mb6MDneEE3XsQRc3uP+SD+i3LlBiG04S4sh/venH/oun7CvTVPMF5jNB/G08m+iN0kjLZTYIwl0BwLTL774=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395679; c=relaxed/simple;
	bh=3ahXMHS/W4vuRGfBZ1TEwcIiQtfT0mySJONI9OMsDis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aTTgPGR5VqEkou7+VArQU9CZGtsQqCN9is9K3jlLabOXPlipcMI4bflkaI1nVidDj0YAjfA9TYt0n2/afjzVEm4Vjo3nxobVWfhQ2elTe+Od98Cez0VWl5llb+OS+u2vCAbbLCd5vkhTox4dK7Y+8AGandXVzlWnROJF8GHlYJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8hmgGFi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8hmgGFi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAC51F000FF;
	Mon, 14 Sep 2026 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789395676;
	bh=3EQvsMYFg9PdA5VYjBnthqoeMbRDfka6RuQ3TdkPwWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A8hmgGFiu6ofUswH09sGn2iAnear0AZmJlD1eBFo9rDb6U0PeMK6rv6YtnxF+hUzq
	 FZ47hcyNCATAYum7o58x5xJiSPSuLEvrEcx3Ff7Rlorx7efFJB6AbjzNM3muNjsgGF
	 0Nozxz87ftfqtHVPfcfs52dFdEul7Xb99yXBL69UbBnNrdmlFplwZlWZ+f8/lrCVIQ
	 TkboKl9wYy2pziqlP5pD8rzBZAvk0QYG+/FhBFhbK+YYTpynFAshK6PyGcBHvhswvI
	 rAakR5NGbdLvTSvbjMJd6OkgzsXAp1g5f4sigkorlsVsa6GdUP43r9QjgfuYIKU/P6
	 h4FguCJmwuFXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] leds: trigger: netdev: serialize mode/interval
 stores with trigger lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260914132356.807004-4-alexander.sverdlin@siemens.com>
References: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
 <20260914132356.807004-4-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:21:15 +0000
Message-Id: <20260914142116.6DAC51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Unprotected cancel_delayed_work_sync() allows concurrent execu=
tion and UAF of net_device in the worker thread.
--

commit d9c1377958eda5198cea4d7f716e117467e638fb
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: leds: trigger: netdev: serialize mode/interval stores with trigger=
 lock

This patch updates netdev_led_attr_store() and interval_store() to hold
the trigger_data->lock. It prevents concurrent writes from dropping updates,
reading partially-updated device states, and causing data corruption on
shared fields.

> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> index 89b48c522c227..6556f6d28547f 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -421,6 +421,16 @@ static ssize_t netdev_led_attr_store(struct device *=
dev, const char *buf,
>  		return -EINVAL;
>  	}
> =20
> +	/*
> +	 * Serialize the read-modify-write of ->mode and the dependent
> +	 * ->hw_control update and set_baseline_state() against concurrent
> +	 * attribute stores and netdev_trig_notify().  netdev_trig_work() must
> +	 * never take this lock, otherwise the cancel_delayed_work_sync() below
> +	 * would deadlock.
> +	 */
> +	guard(mutex)(&trigger_data->lock);
> +
> +	mode =3D trigger_data->mode;

[Severity: Critical]
This is a pre-existing issue, but since this patch discusses lock interacti=
ons
with cancel_delayed_work_sync(), does the unprotected call to
cancel_delayed_work_sync() in set_device_name() allow a concurrent thread
to re-arm the work before the old device reference is put?

A sysfs write to device_name triggers set_device_name(), which calls
cancel_delayed_work_sync() locklessly:

drivers/leds/trigger/ledtrig-netdev.c:set_device_name() {
    ...
    cancel_delayed_work_sync(&trigger_data->work);
    ...
    mutex_lock(&trigger_data->lock);

    dev_put(trigger_data->net_dev);
    ...
}

Concurrently, a sysfs write to a mode attribute (e.g., here in
netdev_led_attr_store()) acquires trigger_data->lock and calls
set_baseline_state(), re-arming the workqueue. The delayed work runs
netdev_trig_work() locklessly, accessing trigger_data->net_dev:

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_work() {
    ...
    dev_stats =3D dev_get_stats(trigger_data->net_dev, &temp);
    ...
}

Meanwhile, set_device_name() acquires the lock, assigns a new device, and
calls dev_put() on the old device. Since netdev_trig_work() doesn't hold its
own reference or any locks, this dev_put() can drop the last reference and =
free
the net_device while the work thread is actively calling dev_get_stats() on=
 it.

A similar race exists in netdev_trig_notify() on the NETDEV_UNREGISTER even=
t.

Can this sequence lead to a Use-After-Free (UAF) of the net_device structur=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914132356.8070=
04-1-alexander.sverdlin@siemens.com?part=3D3
