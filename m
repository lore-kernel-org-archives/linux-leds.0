Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1D3C062C
	for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145844; cv=none; b=W+g4pAZPRBlsWQcwOXHhvlrFiPYgK7FZXgdNG/xZAhH7IynI4Av9iwWLu/xlrrE7iexpoJDmidAbc5bsVEFGhfE/gIH81SHgJDPONMH7/u2DyvgIvlExWPTi6B7/DhH95RDxZsugHaz2N5mdRoMc4XPLEssgLZHOEj2EL9uHMsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145844; c=relaxed/simple;
	bh=9dYUiVu6vrDb+ynn80ulZSUqG/8h5h9HNzQzZ1X5cPA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CCgFvOXsOiQB1t9LTyJKcvYZH9q2/zL4joaur03z+bYR3YA/bVRSQv79a0VzZPvw9xurPvK+PTAgGlusWSPXeZfyIBHrQ+d/64Mi6nx03uMtDfffjKIQRNF592XqnmQRW4FxakHJFJzQXP7s/gnw2QZ1e1coi53CoppcQKJEr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNXLfq/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNXLfq/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95C91F000C4;
	Fri, 16 Oct 2026 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145843;
	bh=lCFgPPVksrJ2pwKJioSEPdrcLcdcEamAiP6pmBCAcog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FNXLfq/bmDiZ9lG36yyZ6qv8tSuSV1MtFmT4lxvQnQVoKWt7/T9EWWAWJ7MdiHk9Z
	 aQtFrueQnlynzqKwrweMTzzcNqZDaXa3rGP44y0hWMs+Q2KEWUDA1X26vI0+mVLanJ
	 ruD92Q/NJhotjAfv2ghdcgBtyqxreJZfEY3xW2VjTYUpnVa2AKP6CRQkQFN7/EaExo
	 7FGUxApw0Z/ts+jcRtk12+t43sGEPHNmPbOdayp91L6Et6n00aPv9ZfX7Yf6gkA2H3
	 CtjyPp1Y9xEDaRDk8rVEtn2qDFV1gzRCz6eJ/Xh2kns5/xiLEfYD3Jspr0cqrmf6Sm
	 fF2AU/N6G2I2A==
Message-ID: <sashiko-outbox-174141@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] leds: tps6131x: queue torch refresh work on
 freezable workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261016100435.2581303-2-yaojiale02@163.com>
References: <20261016100435.2581303-1-yaojiale02@163.com>
 <20261016100435.2581303-2-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:17:22 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] leds: tps6131x: torch unintentionally turns back on upon system =
resume
- [Low] leds: Commit message description is not capitalized
--

commit f183582cffa51c16f099031455716678dcb8eab8
Author: Jiale Yao <yaojiale02@163.com>

leds: tps6131x: queue torch refresh work on freezable workqueue

This commit changes the torch refresh watchdog work to use the
system_freezable_wq instead of the non-freezable system workqueue. This
prevents the work from running and attempting I2C register writes after
the I2C adapter has been suspended.

> leds: tps6131x: queue torch refresh work on freezable workqueue

[Severity: Low]
This isn't a bug, but the description after the subsystem prefix should
be capitalized. Should "queue" be changed to "Queue" to align with the
subsystem conventions?

> diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds=
-tps6131x.c
> index 5c9a5af5af05c..841a6538e75e1 100644
> --- a/drivers/leds/flash/leds-tps6131x.c
> +++ b/drivers/leds/flash/leds-tps6131x.c
[ ... ]
> @@ -307,8 +308,9 @@ static void tps6131x_torch_refresh_handler(struct wor=
k_struct *work)
>  		return;
>  	}
> =20
> -	schedule_delayed_work(&tps6131x->torch_refresh_work,
> -			      TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
> +	queue_delayed_work(system_freezable_wq,
> +			   &tps6131x->torch_refresh_work,
> +			   TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
>  }

[Severity: Medium]
Does this unintentionally cause the torch to turn back on upon system resum=
e?

Because the driver does not set the LED_CORE_SUSPENDRESUME flag, the LED is
not cleanly turned off and its workqueue canceled during suspend. Instead,
during suspend, the hardware watchdog will automatically shut off the LED
after 13 seconds.

When using the previous non-freezable system workqueue, the handler would
execute during suspend, fail to perform I2C transfers because the adapter
is suspended, and return without rescheduling itself. This cleanly broke the
refresh loop.

Now that the workqueue is freezable, won't it simply pause during suspend
and thaw upon resume? When it thaws, tps6131x_torch_refresh_handler() will
execute and force the torch back on via I2C, which seems like an unintended
behavioral regression.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016100435.2581=
303-1-yaojiale02@163.com?part=3D1
