Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB8493633
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333261; cv=none; b=WrQKrMwbEpXCsARm9O5mL9/oLRpBEN/IJMjeagBxkGAYbqv0i/AYrl/6bs+KM0SjAHUkmh8CP5+/t22PCjIp7TPqsrnNR2aCAVUcHY1cN/xyQbjfQmhUHffg3CdWER1EeVnhPJ3DPLjCpC1b3pIEB8X1oRYKFQOmscXmXrD1bOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333261; c=relaxed/simple;
	bh=ZaJHj+aFNOV0KPwzu5ywSBqjOxRTQCjWMFsLgVBTAp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EISRCLk3idE7fqGyLQeCyZ3imh3MJ6K/gJEQXojYIr+enKK5R557qO3tGRtOqVtwAKPSKgXDUZgb0SJdN3Gq1pecfN2Oek5PSgZkAayHCLhgVdFqM9ISrEeCfg7l8h1owaUf47ZBn7+RMPI6xgS+Lu+VDHYXESqJzqj+AREKeIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDzlLMXn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDzlLMXn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381AF1F00A3A;
	Fri, 21 Aug 2026 17:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333260;
	bh=ZaJHj+aFNOV0KPwzu5ywSBqjOxRTQCjWMFsLgVBTAp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YDzlLMXnTjuwodQRmQQ9VUt0cbyy5H+R9wthr0xh74Mxp4nN85azoMP/qeJTAVKC1
	 z07iuO3k3yZaBvDZ+zTipxYeKm2gAstL4EjHREmKn50ICz2Dj0sUE9eNOk1YXgxVut
	 5/IEe34QLYrokYBom2Pzcox6l6VtCQBazWRrAqG+Uky9AwmFlUcctfH1CYRaLtA0H1
	 H/UhG7b/+1xHJdpiIlvK0sJfweWzzjnmElaPj08UfUe5ZlkZBwdViRBaj63MIgwACA
	 b6uNLTZIg4ywuVtb1nikLGpmCVNJINT1vD8ByDO+yF8sPGqJlLE7D7zwzMuYogAvAU
	 BZKOVU15kl3JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/12] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-9-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-9-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:39 +0000
Message-Id: <20260821172740.381AF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Some hardware can autonomously activate/deactivate hardware control.
> After that, the LED hardware notifies the LED driver. Currently, there
> is no mechanism for LED drivers to notify the LED core about such events
> and initiate a trigger transition to reflect the hardware state.
>=20
> Add a new interface called led_trigger_notify_hw_control_changed(), so
> that LED drivers can call it to notify the LED core about the
> transition.
>=20
> The interface only allows two transitions:
>=20
> 1. "none" =3D> private trigger
> 2. private trigger =3D> "none"
>=20
> If the current trigger is neither the private trigger nor "none", no
> [ ... ]
> By default, the config is enabled when LEDS_BRIGHTNESS_HW_CHANGED is
> enabled.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D9

