Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE1E51C04C;
	Tue, 13 Oct 2026 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915395; cv=none; b=DAjszHmjziEsZmerjYdvWUH10VnukEyIsm2NZvLujZPiBiZAiGBdxcuR131qpauffkoOPFQw5XO7JY4AO+Wy8rVTLRykSuQwVaBCqh4ArG/hX23FiFZ8ssh+HCtuZZadI/0KYMeert4moL3qH5No/VWlJJFJAFZxZFOb1xy07cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915395; c=relaxed/simple;
	bh=LcBhze0vI4atklabT709eSxfFZ3K4/s3ZFi3dfElHXk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=emXjBEuABzuiMaFawzHA3rwLtQRVaK+yjjjoED77VlfbTU4nKgEy6+tsj4cLxXkvdPRF8L+iFH71Df+vaje/lJ778hHQSzibRbjmjjdCNE3x+NqMA84gGLTXtSiq6XPJzMADwBbUFKngZije6RhATpIVVz8zbOVIGgVqr+Yxx3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cera5O1t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cera5O1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C751F000FF;
	Tue, 13 Oct 2026 18:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791915393;
	bh=LcBhze0vI4atklabT709eSxfFZ3K4/s3ZFi3dfElHXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cera5O1tq0KDGL6+CKrxGIKy8aXSO+H+AmKd3vW2/UGf5YSEztNttNtgo1tTev49g
	 QsoA50uRYKFnx3MiR4ocd6ho6zmdkonnwnXkz54oDgA9md9siHb8bOj2dgp+uldGU5
	 q/qXTQsOCTmZl8WB8ka0FpdkOEdmPo/Q+NOtbR+CiRwoz3O6wQduIqRYrOiKXXHYX6
	 +YHHRXz73w+MhxlwyPVZmzVMvAQrP5fp2956wpAYTZb0EpqWby4cAnOnssFWFMsMt+
	 CU5lNB6rY9F4ftgTilBSYJO82J/Vsgu3wnwgEBRVSapDhC/rLwI3VKHm7pio2LWtHJ
	 XiGhe3mfOXc/A==
Message-ID: <sashiko-outbox-170305@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013180933.487013-2-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
 <20261013180933.487013-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:16:33 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
> Management Unit.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013180933.4870=
13-1-clamor95@gmail.com?part=3D1

