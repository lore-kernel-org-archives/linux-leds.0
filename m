Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486154D598E;
	Mon, 19 Oct 2026 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404602; cv=none; b=HNN1FVRt47B8TKd0v/xfdSrzXhNEEjwZPORaUVNh23qI34PA2Na3uHnpIoq8wrtFs7n6muRHbwaidKC7iEZ+GuTWgM4irLVBroMH/BPYoVMzNhRNEqyfYLfmXdf5SDnoEyJLsWpeEDHkHjwtMdXsWFwbLHqKYENkOfRlxik1veg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404602; c=relaxed/simple;
	bh=42Fa6p0V8XNIAinbCGit02XyVLdsn3jVw2p0WzvxFS8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bBeHy+FwFR5DB4gmsH99vIblk4g51M6uOCEHPd8fxIIK9TB8GaaNHjZT74HhxBy3sPnx0deTjjy22K9XiaO4J/RWyrCyXe6KtYXqRmGg7+sy8rhA4/v746k0dDaWDUddAB2zJbN/iMoLAHYeU+ZgInoeStaBN1iqZKNpaqcy0PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxPTuJcR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxPTuJcR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD71D1F000C5;
	Mon, 19 Oct 2026 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792404600;
	bh=42Fa6p0V8XNIAinbCGit02XyVLdsn3jVw2p0WzvxFS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VxPTuJcR9BcbxQMW+Ds/Uy5jPiVKarqgGwwixD4YaY7c/JUmjLsemwlXeE3lio/VS
	 N47kf6pzqtj02cz44eCeuascf7qkZySZcE+4MjtEnGMSVqJtrSuI7Tt+RZkvVnMp4t
	 B/WT5dd7BoAQOQCU1nFDZoQ/4M/i6d/oZKn8uAu5tdFNLDGeVQRAW63Rsi1u3RGqUK
	 mox0KnmNV34Avop7vW/JCWJvi0nalPKP19q1bfp24uaLKxxBiDQRxoQpaY2xTgPG88
	 6kwSobDy4wPNA5mVUR5pp9Q8m+X9TJP5aSQJoZHyNM6TfcSc/Vq1VD4U9rb0+b3nMZ
	 SXBgAaXFJCjVA==
Message-ID: <sashiko-outbox-176955@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/7] power: supply: Add driver for ASUS Transformer
 battery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261019100406.103687-7-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:10:00 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Driver implements one battery cell per EC controller and supports reading
> of battery status for ASUS Transformer's pad and mobile dock.
>=20
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019100406.1036=
87-1-clamor95@gmail.com?part=3D6

