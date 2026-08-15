Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2403630B7;
	Sat, 15 Aug 2026 23:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786835512; cv=none; b=Q+GxamnO1kBUFhH2Z/Va/Xb/27dExwE50t/nYkr/ds1D+uSfUZNcsuU79fGMLqVF8KiwJb+dlQhPo98EO+1qKdHP79CdWt+ogPm1M9Qg+BZQ6NVvADXwXEf1dC96rpRTwR1cK1nPKJjO6YcV6JkMq7oweuAG7dPTd0zKIgSMUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786835512; c=relaxed/simple;
	bh=nY7b42oyn5rKWcZfOuZFina+j1eN86hSoOSvonga/Vg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dO/PKqqLwPxhVg+ISDnbf7pcf9RzsW4g94d8UabjOSZobsHmMhC1xv+UjZaM9FX4ZusheaZwfn9DrJ+S2vWvgOfb9V5Qlx1oRrd9KhoROR0oGsK8vGuz9sl15sf/2zdP2j0dhvk0lCc2gtPXbEYMNrFr7R0dBGMmHtRNiO6L0gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/oVTlXT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/oVTlXT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7861F00A3D;
	Sat, 15 Aug 2026 23:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786835511;
	bh=nY7b42oyn5rKWcZfOuZFina+j1eN86hSoOSvonga/Vg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/oVTlXTnbP7qItrftvPgGZqGvoMnOHMoW4kJr1AqaGI6HUiObrjSmf/r7r33UXWi
	 /hX2CYgr3bZUX4BlfOJ4uglo492s4eHPpGEPb3eeVNLGp4eM6SAhZJr+GGR3OMfKEg
	 CUSGR8cbf6IABeHPddjOqY00H50G0NJ9dv3MCoknLIokrDV7u4RYbu8LtkuKszL6zB
	 k2z96s3zHV/w3drklSnPvo02k01KMmKBasZ7WD892/bXJDr4n9aKgMcsHazBaM8zhc
	 av76vcXXtZYe8hFrl0NpLsyjH4k/VBVoTeN1qkP9vC0VsP7DjRhG1+KCXNeE7lJ4/u
	 eXapM2mtGal8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 1/7] dt-bindings: leds: Add IS32FL3207
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <d5df0bb5c312478279f0d2fd5ec6305e41add5ae.1786747084.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
 <d5df0bb5c312478279f0d2fd5ec6305e41add5ae.1786747084.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:11:50 +0000
Message-Id: <20260815231150.BA7861F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The IS32FL3207 is an 18-channel constant-current LED controller with
> per-output PWM and current scaling.
>=20
> Describe I2C addressing, power and shutdown controls, RISET, and
> individual or multicolor output groupings. Require board current limits
> for each output and document their relationship to the RISET-derived full
> scale.
>=20
> Allow dash-suffixed multicolor group names when a group begins at channel
> 16 or 17, which cannot be represented by the common schema unit-address
> form.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786746757.gi=
t.ahmadexp@gmail.com?part=3D1

