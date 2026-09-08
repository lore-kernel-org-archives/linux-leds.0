Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFB335F5F8
	for <linux-leds@vger.kernel.org>; Tue,  8 Sep 2026 05:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846321; cv=none; b=OtAqb0LvDRriuwPo76jJnlpav7u0OeaLzVWLD1j5UEyFwPHEQm9tUSpZMLG6SzFkD21jpet069o0kzN5w09TpS4QnwlnVDiAxSPar7b5pVCpPaxXvW19PdpAC8A62dwedZ4Hp7IJ0252o8auawFd75ZN+ywApcZhwEOnZAm+NRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846321; c=relaxed/simple;
	bh=GKd9bbzvVeuKO+TFWHKTaPqHZe+PsgKyDgu5rmWaY58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mbg60ssiLs08xaDVW7HWUqKblzaf681IFIQn/fyMBeV5q9pNra/zlVAkR86FgiIJ6t83UH8gfuV29u2OP+Y86v4Ru+I+3P/vY+luNS6n8+XRAYuUk3AO5uHH/ENM8JxEc/OOakqHkSsu6+58xs3WwjR4zluce2p1tXVq4bj349U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6vQTlwN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6vQTlwN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644671F00A3A;
	Tue,  8 Sep 2026 05:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788846319;
	bh=GKd9bbzvVeuKO+TFWHKTaPqHZe+PsgKyDgu5rmWaY58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D6vQTlwNXlvysPI6g9RzO6fLqy4YY/2846gK972MnwDbkcS2QWreNipLXJvAw7J01
	 9q9hyMqOYcP5BVUKGgHL+eN2JtdBzOanDTxxo8Ms7uQfxivX/L469t13h0XMRpyUzP
	 kewIHcqQ4dRFyNQNLdSewACb962bWhi4V5vkfTEgsbP4W7M3q3nxn9CCWHxSEkluye
	 4bHoztV4PmKXD31dhWFROL+ybMrSQOhcDwdXOTrdlixdKoTfqU1dsFSb64zm2aiQSE
	 tnNVxHiPDAqfSBSwDeU6gdrAsXqjdN4D52GxOu8+NbMgLns8ItsrhSPk5stMIPwG1n
	 bdU8ifD0XQ+Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: rgb: qcom-lpg: Use fwnode APIs for LED parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260908053221.29955-1-rosenp@gmail.com>
References: <20260908053221.29955-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 05:45:18 +0000
Message-Id: <20260908054519.644671F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Convert LED and channel parsing in lpg_add_led() and
> lpg_parse_channel() from DT-specific helpers to the fwnode API.
> The probe loop now uses device_for_each_child_node_scoped(),
> dropping explicit node lifetime handling.
>=20
> Behaviour is unchanged for device tree: fwnode_get_child_node_count()
> and both child iteration helpers skip unavailable children on OF,
> and the fwnode handle is passed straight to LED registration.
>=20
> cdev->default_trigger is only assigned when
> fwnode_property_read_string() succeeds, so an absent
> linux,default-trigger property no longer yields an uninitialized
> pointer.
>=20
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908053221.2995=
5-1-rosenp@gmail.com?part=3D1

