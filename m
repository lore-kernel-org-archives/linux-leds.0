Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FBF3ABD95
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481190; cv=none; b=snFM0S5/Uu5xJ4dbBbCwdqQcbcIlY4Blc9/JAYGi57tHk1eUC2k33iiUfZ6GRbxXIz15PU6B+TQsfMgTJac+YdUHXFL41QhhjdrrCzRHXxColwIxsOrNeMyRlgrkFZpL4uvvmfmqLcELoFUD12BV4E/SUOLY3pnpHZieDzNultc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481190; c=relaxed/simple;
	bh=qtX7ONO1LuVDmEELMoWiGWl6xNm6vZgUGFuJ8KBbyDs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KP8FbxiCpm9UhOBjjIrjNo64RcVfli/AEGWVDc7wuz7y0ZNS8c5RRotqS87wrvQWX2kT8eYi8S5RnceLa388s9JAU9FR43HxngMniFS9pngMjq083LnCo9gcFS2pnChvhCC3/7RZD83TeIWXjZSpM27MO0Y4w6BDqeWuP1EkCMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqZswSWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqZswSWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160721F000E9;
	Sun, 19 Jul 2026 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481187;
	bh=on+lJVsRyHPa/SXXmRgIshHB2NwCfdmZUPCLe3DIvzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TqZswSWZlD2rYTiFeKZuvcuATVYLD7LUZg1r8Z8dnq30c/sACXiE+gpaPi0FS3XKZ
	 4qTqr8QvAFsQTmIBAdM1nRSJLBT1UvtTBuRWsmBHWNLS1SnUeHx+1H2vbd3KAHQRfX
	 ANlXlW/1hvkw1iWjietrSdANRI+e+z/824gtg+L0/qoHlprYzaK2G640AXkvbbHWEx
	 L1pJwXZLT9AB3o848LgjSEfIEXPMjlfLFW1XzDM9xos7s5GFGDHxyGQ0VR4lfqkEbn
	 w6Vx0LkGQYbMxkVv0PEQBIjUwJdtYlxvX3Bj9U9U9iBvdGLjGZKCw0AbbS6fbh7VM1
	 gN3rIiB3ELfRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 03/11] leds: trigger: Add offloaded() callback
 and provide trigger_may_offload attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-3-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-3-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:06 +0000
Message-Id: <20260719171307.160721F000E9@smtp.kernel.org>
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
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D3

