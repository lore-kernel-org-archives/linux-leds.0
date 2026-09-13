Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21619377550;
	Sun, 13 Sep 2026 02:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789267805; cv=none; b=sWPuQD+3Ufq3mcLWZ3LCld6mChYHwP4L7kqEo68Ok9WsRSI2puWBwRz7LgbO4lHfALbL56b7bRT6IPDvoEaWPjp0vhKUASWoWUMbYiXCagwtFSai2YkIHLvY+v3h7IqRcaIETR7rlBCT80FokxvOViz+r28WTsxFCKEnHKaXKWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789267805; c=relaxed/simple;
	bh=A5VFegc00OARHLJk+BNQgcS+R6ngdgDye+FWDLCUXxk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZTTtiLhX5sAaYt9O8NRbm/w6DoArt1EOXWjVrLN+I9ivHpv3C/Rs6ECIVCV0qYHq0chs7sjFlrrNkJiaDhJ/GQiopT9lBucYdRroYWqbTKUEbIiZCHl0CDaDt6QW1PSj683PaBinQkHZmPz8ojS4Xxo+ltkZvfTeLUzpDLz7plY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAI15p7D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAI15p7D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C1E1F000FF;
	Sun, 13 Sep 2026 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789267803;
	bh=A5VFegc00OARHLJk+BNQgcS+R6ngdgDye+FWDLCUXxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jAI15p7D0ad43QtYiGMcMEEiMYg6SxFhPdfxU9Kobsv7ANuMLDkW1QA9K7K2Cj/Eb
	 n9Md6f+pkevTGdmFuG/tW++fOY/oUqe6xceSbV8LmMjpWo0+PMUROaKHv+UF4hWdUH
	 pG080U7ZduTPSPHfVcc8f9zla3G3gZ1EfA0i+SR0PUQkx1cjXcGZo3GbCQ//Gt6aEo
	 /vRATL9PrkjeCW+rRQlJq6grss+tRnEi3TCxzBWKX5VbRJSpyCrjpky4tGKZUNysek
	 N85dmEwi3P/CHDFyf/K2qI+mRm74LDnG8KAzME8s8K3fEpHDcsFlW0uCbduL8apagY
	 xww+5WzgeVAkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudraksha Gupta" <guptarud@gmail.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260912-expressatt_camera_flash-v7-3-e1fd2edc8d84@gmail.com>
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
 <20260912-expressatt_camera_flash-v7-3-e1fd2edc8d84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 02:50:02 +0000
Message-Id: <20260913025003.53C1E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Rudraksha Gupta <guptarud@gmail.com>
>=20
> Add camera flash support for the Samsung Galaxy Express (expressatt).
>=20
> Downstream references:
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/=
cm-12.0-YNG4N/drivers/leds/Makefile#L51
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/=
cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
>=20
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-expressatt=
_camera_flash-v7-0-e1fd2edc8d84@gmail.com?part=3D3

