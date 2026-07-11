Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858BB4499B8;
	Sat, 11 Jul 2026 19:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798201; cv=none; b=hKRqZ8+txjEdZBinAeyrOTe1FCld/7xQFcv1c+vqmrmxrm+3bOjTuln5sxWnsS9oE6/maUEyFd5Eav2E74jBJTA4wmYfZgwEhnLGtIhqnNq8gwG36TvYaM8FYrNRqWZZDrBvlxOL0h7TeM2mvUjoKyWX0TQIQOX7X1wpjp01Tlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798201; c=relaxed/simple;
	bh=Z72G4XJL1vZSUbt7YIAuY3GQc7bvXBA3paoTEFi5o+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ps1iN18hjtxhy19JMB2G/2krjeYo3sL96senenzXmvbcaTJbh7mIHlXRA3s3rbi9ZntUa2+cQL1TRADnqa3ykvtZ2gzbuSjobICSpa7Rw6Y10ZS15NUCgJ3qryKx69HK2ywNOWUjg7fnpzLZafRk1mwi4ypDEuLkJhFoLT5364M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRgjZzyw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRgjZzyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F211F000E9;
	Sat, 11 Jul 2026 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783798200;
	bh=Z72G4XJL1vZSUbt7YIAuY3GQc7bvXBA3paoTEFi5o+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DRgjZzywgYjyoLILTMe7ftLalsvG4TxjfwSCcRk+AZqEV2W+IiU0nKR/NcI39WjLh
	 qU4yj6kC4sPfsBg5jcx14xhMFx0vC25jYu0ugpR9QswpGgGItdLi6v068XM48XEhrg
	 078pi+hzS2LgeSmcaoZNDMPzgx5RjWdAEeAbv5WiFg3QIqLB5xQFKjsM/LcVsuUVm0
	 0ObFO8GFOWZ+7oTcwk0cCnuDZy9huP+H6bRq7C3LAYQ7GFLC7czjSPQehAQTGNF3uI
	 OzwCMW+X6fxYNhMtHFxS5pFPpAbnk0/teqAxLuuZolj/tEQcVh33NmUNZ2X+jkGvwU
	 QPNO6vzwqz03g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samuel Holland" <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260711192842.845048-3-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-3-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 19:29:59 +0000
Message-Id: <20260711192959.B7F211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
> Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
> computers.
>=20
> Link: https://cn.techvision.com.cn/ [1]
> Link: https://www.techvision.com.cn/ [2]
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711192842.8450=
48-1-samuel@sholland.org?part=3D2

