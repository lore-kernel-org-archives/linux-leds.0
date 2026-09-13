Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8A638DC71;
	Sun, 13 Sep 2026 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302900; cv=none; b=Vh63Q2qekQxfz/UIcLwWrwju/D75OnJ9SslNygcgDr5xBHWK2XTXxu32wQ3xrtkHFSpSH6B7WP0tQsPqCN0dRAr4jBrMstw2hBIkU30ipPJCXhqdGpo8m3Zu9ctwZ2lBwPlK95k4OqwbppZHKLjIeohdz9ncOtPGwD2P4rMUzrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302900; c=relaxed/simple;
	bh=zAvfLm2MUpLD7KzWqPanjxXVlHWC6SOpqfitKHTT9Bs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y174dtIIx34VuYoUj11P+nycRqG6KPno1nULAmBxVRkXU54Np/SwouiTFSrg5TbYDoSYFOUOpuPlci4pgijoin7tmATUgEwQQJ1e3v9TM0Q6qMfwZoku3EqObtpAzy+juLwoxI/xO/vDvaiZC4bPVHwq59tGlY/bSq1ic8slf3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Atud9ZO1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Atud9ZO1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB0C1F000FF;
	Sun, 13 Sep 2026 12:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789302898;
	bh=Zdh2LU3F7Skw/QyBZEFbG5PG0Y8VX4TxCECvpcnLg2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Atud9ZO1r9u6Yd8P+UsyvzUNkHjlyoQ4tRjG4H1Dx9WmxBTY9EFUvORzdEk4L81xI
	 +ahFAMspMYS/umCB/0ol/2jhhVuqsQ8BuvgwZ1ZvMO4577lnsHOiBvmfyUJQilF0k6
	 YB/SVj7LvoLR5tjsg9XQWyfLCxO78Cmq8ojB7OS//xpcaeNnLhg0+htLeNFxTebY1d
	 1h6My5X/cCudUNpaZyQg4HKofEzQBha6ip1oAr1LuiVHdbgI5YlnXAZL/PbmWyIsoR
	 J9Tq/qznuRjzniKUriUuHxumwonJrtMcdTrqqlhRITqqsvKhsOgRFQ+ndalKWQ09KY
	 KD+PVO6a6rTsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Use consistent indentation in the
 example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260913123301.100129-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123301.100129-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 12:34:57 +0000
Message-Id: <20260913123458.5FB0C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913123301.1001=
29-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1

