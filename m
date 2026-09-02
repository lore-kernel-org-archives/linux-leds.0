Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFB6426408;
	Wed,  2 Sep 2026 23:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393081; cv=none; b=DEgFNxZYc/EAFERRfB6XVogath2BT2WGPuUCS8NzJuaeEUmRtgEFvoyVyDt81wrRscmBWOUToTfEyVVUujX/xhef45luTRbAViO88PIPrur5aKkOySCGrF4kPduSftue0kgKbWvjHolFN8NC/Fh8NmrRAB15KF9mA9xx9o3I0m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393081; c=relaxed/simple;
	bh=Ic8U1bIxiKMhYrN6NCo/MkX//NKQkOKwukPEjgYkFyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mfM5uQE8wz5wKj6ib35TKPnLRCK5knHsfW4vPk+Ttf+Ia6q3B1ze57NypDgG9Tr4sn1AkaIjXCDqD4TuYQf+9dYGXKY0jN8yjqO2YuQ/WTWAJgn25jyDG1nP+fNnzr+2u29No5hel591nh/SD9a4/Mp3+r8mDyKFekXLKweZduc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlnyCZQt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlnyCZQt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83921F000E9;
	Wed,  2 Sep 2026 23:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788393080;
	bh=Ic8U1bIxiKMhYrN6NCo/MkX//NKQkOKwukPEjgYkFyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TlnyCZQtwcgnI2bx01nRAjD4gq2QvOWwQIli+mfRFFezipi3bl95bMeN+eFQRdK59
	 JQ8X3n79JScFHbUKuVtdDPk7Zb2NotHwrPfl/8dsRXoWYEtxOoRRaFyW8V2KG/MI9e
	 tyPJGhuuI51eWwCl7lK+2XbN/y/1CpKsUBIYCrT3ffiEbYPSGXFXfMsdzjLEeU6Xge
	 5S+XpNeKzyG9Y1ogrwmW2788f4ljJJE8UAsnB4LfGkAQq0RaKH/SQoOXw9Op43zXrn
	 Q7x2ENMwcqOi5blXIdXqRrcLwk0MsRoA1wAD7+UVTSom28QsTSSxm8dKw4mwf919RO
	 Vqg8Ln8nOMKYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: leds: Document LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-upstream-ltc3208-v11-1-28f5f0fd364e@analog.com>
References: <20260903-upstream-ltc3208-v11-0-28f5f0fd364e@analog.com>
 <20260903-upstream-ltc3208-v11-1-28f5f0fd364e@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 23:51:19 +0000
Message-Id: <20260902235119.B83921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add Devicetree Documentation for LTC3208 Multidisplay LED Driver.
>=20
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-upstream-l=
tc3208-v11-0-28f5f0fd364e@analog.com?part=3D1

