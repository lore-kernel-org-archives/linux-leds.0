Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F113380FCD
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372952; cv=none; b=HDlU33dN09nRCWYZBkDblMkbvkYuNaVV5fUOpL1IRXxJrjmhi4tIOTbV+KpMuHTlwRZINtklHa6TxM0rbHlCk2FpEbPq5oq0aRN79d8N8Ha547Q+ij/QCmpLRF0HUkBIy3fSwUouXYEINTcHcXprjijyPW6J8XgI6I09DZuPLR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372952; c=relaxed/simple;
	bh=yG/sMJDQkWpaTugjxeahEIEkPrBAdruHQbqGd4N/hPY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q0ahEeAK1s98peDujcQkoET/i4nHgmAdeOBNfiYEMOGsT0w7jTTJXf/hEcyEeufs4BOLI/k9+qkkR81lrgWm4r+L5pRz84SnjHpwEfCIuYmm2enKmjxTfSfwJ/ntjBxTfFrJvQNz7onMpngq2ZVWSYz5MXV/tHLTmNDY0skeuu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opo2LTFW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opo2LTFW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D271F000E9;
	Wed,  2 Sep 2026 18:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372951;
	bh=5izMjTcHyEHhwQTOM8E5qV/R5w9tO6JcIg/N67x75Ok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=opo2LTFW+cGi8TCuvIG8J/F77Z/wcpuCn6m9/GuMnl14w6gv9HJV4690p6R/A1/Sd
	 EtqWIyYp4Ynka2mv59gIapYexsr5pTYVvVbAZQFya42EXah26d67ARWblF0wwzYYbV
	 49UX6NKbkE4117Qh/XNW9JKT7j2WymHbHJQW7E8Lecc7UM7zSxCWmVcQKRLUNobJJA
	 pK8sAjtGmhyAbES5OuEBBHGQ+MW69OV2m9rQvQYu1fECM3KzT0pEiRmIIHAPZeZZks
	 R/5gvFY7YUxZcQfTFJuMK6sHN2dGss7p/rhc4pGUDUCWfMfRki5Rf/8OCj4cK7VaV5
	 AYKdhCzmSU4Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/12] leds: trigger: Add offloaded() callback and
 provide trigger_may_offload attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-4-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-4-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:50 +0000
Message-Id: <20260902181550.E5D271F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D4

