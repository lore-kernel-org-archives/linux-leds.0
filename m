Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D7B3DAAAE
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372956; cv=none; b=Hjl1+BM4E+ItsiTmbzYAX+tHfynyLIYSyWI1COqqvkdo0AKkDwEuNitUFEHlN13rPcHsDp+xWQW4HiUM0ZUDzR2umx8qVxIsWgO1uAOg3g3e1mCXhwXg8+O0l/xxECutDAyGEZeCBO5oTdvGee/T295wSgL5+wim/YFsQ/pj+Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372956; c=relaxed/simple;
	bh=9bHUPRLrK8cnGqeLuxywq25hRiIDT7kXmmaQPun4THA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AcpDlxolCFljo9HyKmO6uPmHM9iHGGjfWezAAcg994ibZB/zACyhrXMAOthx2biS+GURAyVIYwuSj48u1UEakoanPgnS4jFUEz4pVcFV5c7ME6Fl5/I4rN3SSOzHxMz38nQfK9SzCPalIAFs5mPi22toqKAiETkRt86pBMYwwfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxlYUCkJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxlYUCkJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC801F00A3D;
	Wed,  2 Sep 2026 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372954;
	bh=9bHUPRLrK8cnGqeLuxywq25hRiIDT7kXmmaQPun4THA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nxlYUCkJG0MVADNE3TXojTCA2E4jJpMIuKBLA4UKGMhNwzKEaOYXv/ySAXhg/ZaJy
	 ijWuZM9i1ce1NbtKOfeJm07aqx3BkMRSyWHsyhzieWzoOva0nhdupHrYRFLEx0TtRc
	 5CDNRu23VEiDL5qmA8dMv7Rd3UXNXo4ct2o/DG9iA2EpWX56bPcZc3RXCRaxch83ek
	 wdrdI20FddwoEvlghqBtezbc6ZEwk8UBrHF3vt6Q6QOi6Aqv4S1AbfuLkZpaJZKSTb
	 HAGpOV/pfEK1oSQfNXyhUDXtWOrBhjMQOGnA27lGIVAJ/UWwTJ6dF5VCEyOjhAnSpg
	 R5dVrkXm3O67g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/12] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-8-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-8-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:54 +0000
Message-Id: <20260902181554.7AC801F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> With all existing triggers adopting the new interface, strict checks
> could be enforced to make the semantics of hardware control triggers
> clearer.
>=20
> In detail, a hardware control trigger should:
>=20
> - Implement offloaded() callback to indicate hardware control
> - Associate with the LED classdev's hw_control_trigger string
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D8

