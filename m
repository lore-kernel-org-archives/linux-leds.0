Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41F14915A6;
	Mon, 28 Sep 2026 09:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588980; cv=none; b=QDt7MA8olm1GTNH/gaZhHgppF7MvB2XRqPPGG/4aiZH3N6G4TanV97POfVF5uBMtQH/udMG95WUHv6zhHnsBfH3FirTYX1hpeCn1YToqo0pkTG7seElT3N+gEKVU7TF+ArtrWEe0aSQjQHljc0TTPBX0c2seFiz5Fb2ZfkFye6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588980; c=relaxed/simple;
	bh=EyjPmT/Ys2a+f3bzUvSkLT31FzIs6K3DCyTn1CeUiMc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MsL/sb/RZ/FF78eaCcQqzJ0Vw9mAQoF80tVg0prNjZn7z6pz0rVyKb7quz6I/AB7dcEGRAe32uxwRyBjzCL94Mj1mpQSKiKeF+26aA28fOcO1/khD6B761JjsGOAsrSXUYU2Wm1n8Vp6oCoRTkLfMIiGB0zhTIMa7hucUx3yvlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsmwXhfJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsmwXhfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324B01F000FF;
	Mon, 28 Sep 2026 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790588978;
	bh=EyjPmT/Ys2a+f3bzUvSkLT31FzIs6K3DCyTn1CeUiMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DsmwXhfJy6O1/TNPBKXLDu5uVKRUuar2FTu+O75HYAgdcQ51pwvR93lcFBKnandUu
	 IsTHALecQhe6zSVxS7MNIOFERN4Krv+sDZvLUeyOMbhNSqsXt8dfgg4LzDqgGGareY
	 WwVaco5j3W3vMHOpT8YGBP7IMS98ta+7XBY4W8odCNLgbJ9aICRsSi9SI6oGfFjh4J
	 uM1iUZJYKVSUTFhYKZ4rKmgkAo32Z/AUqvoFM2f34wIaUM9NmsWswNgWe/QFOuv3KA
	 4c3gjRZPgcaPufX33IL0pwC+MTz25o/t1at2gKyHFjRiTscdV5cFJfpBmq4ZQP6vvR
	 LfwBuZqBNYuYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: Document TI LM3643 dual LED
 flash driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rillian Grant" <rillian.grant@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260928094302.86966-2-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
 <20260928094302.86966-2-rillian.grant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 09:49:37 +0000
Message-Id: <20260928094938.324B01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Document Texas Instruments LM3643 dual LED flash driver devicetree
> bindings.
>=20
> Signed-off-by: Rillian Grant <rillian.grant@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928094302.8696=
6-1-rillian.grant@gmail.com?part=3D1

