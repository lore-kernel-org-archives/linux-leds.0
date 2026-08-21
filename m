Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E6493633
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333256; cv=none; b=DMAFNRlN275rTXJAbqpzjiXTXvNQ4gjJv2rbkqXtyh0ECoj3/7M+0InAZmqVZ9AzG2BBnLN7S6saYk525gFcYv+AaDR0QyaDv+lUtY41Y3I4+Pw0legIKVwk+wtORvhSUMGzwK7SdPZQv0zX0c7i2d+bs9bLxyS9eG5zFyXvTRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333256; c=relaxed/simple;
	bh=CtFSvw8XD6Y/2Q7PuDaG3VRaocO10EKAOBJAOTBAARc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fx4xLoJ+H9aZdkTjBSCEpJLHQH+36YMGBZo+45PvYfQcj3zoHUhSoreFiGo4qJ/93HOqYoqGjEUf8vocr8OKTWR8NfqTnv1Xog4cGmTd4PzxNMVQob8WJhPatMUNcvSitCfGzpCTXgOv0fXoexDv+tkxjY+ykzCmvE2Vh9qqEt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAcKz2HO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAcKz2HO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14E71F00A3A;
	Fri, 21 Aug 2026 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333255;
	bh=qX3MGDLKr5reftJS7i5Y5joS5C3oBQ9EV5AymOks+vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lAcKz2HO/jl2DWS/W+bVVB09adSHW9u+u0WzT2QaDVi/d4+bnTXquAwtK24SjTxaP
	 MjOVvR9+a5qQe3XnSTPPATqMnzaDR6x3+xp7ffYWaAit/Doo9u/HaGu8ka6AgBvrty
	 eQrJp7sa+yoQWTtd5kHiv9dmfNyrqIj7RejREXSzJ1svyr1vULYiX2Z+gvZMWr8s0U
	 H1axHz/RvF9cAONWOIRv3ArFuKXJwGhZY3Jad0roK5fTQvQ+IimbTmShQLxY8BCZiw
	 8QGDavI69mA31nqSzup+KbZlkty2gG0siA7qT+W14ptGMi6BiCsoK4HC9zKjvm2RfJ
	 8LIdf725IgZEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/12] leds: trigger: Add offloaded() callback and
 provide trigger_may_offload attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-3-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-3-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:34 +0000
Message-Id: <20260821172734.E14E71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> There are multiple triggers implementing hardware control. However, the
> LED trigger core doesn't really know the hardware control (offloaded)
> state since the coordination is done directly between the trigger and
> the LED driver. It can only assume private triggers as offloaded and
> generic ones as not offloaded.
>=20
> Add an offloaded() callback so that triggers can report their offloaded
> states to the LED trigger core. When unimplemented, it defaults to true
> for private triggers and false for generic ones to keep the current
> behavior unchanged.
>=20
> With that, provide a new attribute "trigger_may_offload", so that
> userspace can determine:
>=20
> - if the LED device supports hardware control (supported =3D> visible)
> - which trigger is the hardware control trigger selected by the LED
>   device
> - if the trigger is selected ("<foo_trigger>")
> - if the trigger is offloaded ("[foo_trigger]")
>=20
> Note: the documentation describes the attribute as "returning a list"
> despite the LED core currently only supports one hardware control
> trigger per LED device. This is intentional to make the attribute
> extensible in the future without breaking userspace.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D3

