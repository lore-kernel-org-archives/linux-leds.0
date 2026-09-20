Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8946357CF3
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934256; cv=none; b=NBaLNsDVGihGAumnIxDaAQY5PKP4TsrJfIa4nwi+lzjZ8HKvCPxlKUdKY0t6aRFlim9L3mCZTYG3Dy1rf90XGBr4//k3ss9kvo8oyQ1Rz5XgKlygR3yzP/Iu8E9INAcTHyNKy0du9ASA0j1L5f0lsxQOWwbg5fYfENHHis4dC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934256; c=relaxed/simple;
	bh=f4F3Q9ayvzjTNq6ESo+s8pQFJVaVvIr4tOQdIOQwOa8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dLzAsRj+s481z6G5YjqLw2SDcno3ixlqr5S4+6Nlwz6blNwdTfkHibO+o2B3H2e4q+OkoWh+unOf8NSSZBkvWWbB2uRTm4bNkXW8VO0gbLywDh92xQqmymi2JpdPpNO1q4IgxOjnnM/zt0T78oQSAXjKBDJWujZXwMNxmpWGzTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MRTycxpV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MRTycxpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7969D1F000FF;
	Sun, 20 Sep 2026 19:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934255;
	bh=579SUy21ooxO9SoYDeTdgPi0G/d6qfjSm4170jYkHbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MRTycxpVsS3rfftkhdwmgAhrw43570YScW8hwquhzQ/kl95BLRVPI6b0XxlTR73fm
	 25YPfhTVVgR9QxL1fo8nHJgjN4Bp1+3m0lJcNZXIn8g/EVNO0SoqCaXqJ6d35iMtGg
	 41YxklSUB2Amx4uwn8xGuxyGm1COb7dkLPMxNwSXSZLnoVLa1d6UnUOSPp9XFjcdMe
	 7kgrHwfFrwcpnHbB3sMYEf3s4FRQIdf20HdCmH7BSsqcuL6/CJyOXaaDj0d0toIyAQ
	 TDT1mAFPeLf+oG9S5g0/oNx2a4+8cmM6zeJWmbQpcliDPIPe2EhcFojyQJQAYlpk/B
	 eG16PrR7fWP/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/13] leds: trigger: Add hw_offloaded() callback and
 provide trigger_may_offload_to_hw attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-5-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-5-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:35 +0000
Message-Id: <20260920195735.7969D1F000FF@smtp.kernel.org>
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
> Add an hw_offloaded() callback so that triggers can report their
> offloaded states to the LED trigger core. When unimplemented, it
> defaults to true for private triggers and false for generic ones to keep
> the current behavior unchanged.
>=20
> With that, provide a new attribute "trigger_may_offload_to_hw", so that
> userspace can determine:
>=20
> - if the LED device supports hardware control (supported =3D> visible)
> - which trigger is the hardware control trigger selected by the LED
>   device and offloaded to hardware ("[foo_trigger]")
>=20
> Note: the documentation describes the attribute as "returning a list"
> despite the LED core currently only supports one hardware control
> trigger per LED device. This is intentional to make the attribute
> extensible in the future without breaking userspace. IOW, userspace
> should parse the new attribute in the same way as
> /sys/class/leds/<led>/trigger.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D5

