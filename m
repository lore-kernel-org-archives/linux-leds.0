Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548AF49B475
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 13:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331849; cv=none; b=eTZQBX0tCgTvWaxDQFsPbatYDfAb2N3U1jhQ4CBVYxKmsxUsD2b2H5sHi2V6/hycvo8GICtkf0lHAOP3AAHeWFXpaPQ0w/3oGiiGxMb6o8Ss79YA+1bZiUGdw5O6c3s1TVJ0IxQGfWFJE94n4oqWePBrHD+nIbHiMbIBmdss3Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331849; c=relaxed/simple;
	bh=+4s3nIWv/IawLeKnXeuwZ6qTQREAhmNXK8gVk/biybg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QSLMVvXUa5cA24k4Wphc4hal0x97S/j2h6nvG1WRe33ov9OjGyxrBsPQeXHTWkUnHvHuYFPIUCK++pZbYtDVwSm6y1kfCIg38vw9lASWmjAwuf5oXQxa96N5/RpOSSFf5MJRWrY1i+TwhXIcsiNNnkVpqw64uKKzaoMHgfrK+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgXzjdgl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgXzjdgl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B4A1F000C4;
	Sun, 18 Oct 2026 13:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792331848;
	bh=+4s3nIWv/IawLeKnXeuwZ6qTQREAhmNXK8gVk/biybg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZgXzjdglSHQAcI7Gk1UAR5STaSIOtAGX8tV0HyMqlmv3lj/K3kMYOi+uR1I5J9Jds
	 vNv0fEZ/H1ZX19Xk+64+eMYNz1QlSwJyLay9qmZ1ckzUi7iE1gplTpmYtdoPVJ7I6h
	 tfPWMlFW17f1nQEpDkfF293D1B8G1QIQYJy4JuBEYQfLbPxXzSBnHjom0vDsYTT1Gh
	 OHNEKJUe3Ddh2coocruhipljFm7EsEkOJAgVUDKIxnA4QAGmBzHUqxBqxSRFt3+8jJ
	 C6Gqu3EXee8hF6BRqcX2U7f/eFcusVpY08XIqCesh8/mxfgnY5sDdUaoRgLnZqk7qK
	 +G61aRrzwWHPQ==
Message-ID: <sashiko-outbox-176170@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/10] leds: class: Constify sysfs attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018135339.1109271-2-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 13:57:27 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Mark all sysfs attributes as const to ensure that they are placed
> in readonly memory to prevent accidental/malicious modification.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018135339.1109=
271-1-W_Armin@gmx.de?part=3D1

