Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9CC397B15;
	Mon,  6 Jul 2026 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353868; cv=none; b=B3Am+8iwqQC9eB4AbaBDt3ko3bNNwMp9+oeAPTohlHQ5NujUYjfyP8d1JnJchFoGsm5w6TOxPIb/tnK230jNEIvvO5kWBmkyaioF50VZa94CmzY1TxchMuduu4dOwWXdJDG0N2XD/40tW9ozwAxPupF0bWUeGH8KxNCBWu5lZgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353868; c=relaxed/simple;
	bh=GIEgZByYSXBhRKSyIQu+qVyhXZz4YK7yZZ16KXCXdDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AJG3q90pw0dAPOIx6fpvl0GWu0C6xGbe/EHjvY5HkVLDFg934NhFutnyMmg98IgiS2Kp9uE4x9LOXv7nk7RK+g6wXPcAVe8yGhjw2Jrs/N7wmXRJ43oFq4rnfXK1mRt8llx4eu67HAmBOl5+RJ92aOeHZM9waGBmD514JQstjRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kULP+gS/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kULP+gS/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EBF1F000E9;
	Mon,  6 Jul 2026 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353866;
	bh=GIEgZByYSXBhRKSyIQu+qVyhXZz4YK7yZZ16KXCXdDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kULP+gS/mMTEXFrAYz6SMWHbCh8LRszKld1pNXsDo/98C2oPOB64tNYjRDnU/WbRW
	 L04BdMC/CnlccdW/iAcObb36yqF0I4FwztAVo2sfGj7oL0XuXKBLizOZ6iLmWgXal6
	 8Lckt1CnR6y+BY4d7YxbK519oE67nlbN2Ri0fCA6ynMYufMjE825aUiD5Cor0aw18i
	 Mwu0gTvgMVdNo3rwKi/1IxGiEaRUDubLudYFaVONwYyyBbuBe/bM5MYpPaG5bCuq9W
	 B9E4nWHM0C+YKJHHbEsXgbTH+x8YvBTmBYE6cSSJDdgxBnZ7RDlqn9AtgJc3gtMMFn
	 osu/uopnkJLyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] leds: pca963x: add multicolor LED class support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706-monza-leds-v3-3-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
 <20260706-monza-leds-v3-3-37ea8c988363@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 16:04:25 +0000
Message-Id: <20260706160425.E9EBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Allow grouping of individual PCA963x PWM channels into a single
> multicolor LED device by adding support for the LED multicolor class.
>=20
> A child node with sub-children is treated as a multicolor group,
> others are treated as single leds, keeping full backwards compatibility.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-monza-leds=
-v3-0-37ea8c988363@oss.qualcomm.com?part=3D3

