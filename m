Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DD538A700;
	Tue, 22 Sep 2026 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088687; cv=none; b=qfeM6fL8ikbUIlbCmS4ReTUMvefP4m2CxNZ02SK19TbUa5B8ZsNL3FVprANITn8dDP6o4d4U5y+QFrxR0YULgdnkcVKg+/ZEh5m5wvM4W9PMIubpR0dEFvcKqGkKVwvN1+l6gJCiwU1VO3H98SWthZz8E6ggaXovDTr9HAqxmgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088687; c=relaxed/simple;
	bh=t497RnEMV/SX81+SUwhcnlYsTUBerAX8lJcQCB7HtAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cHNEhYcc8xblS39zsFtBbqI014n19QDj1LKeacEqaDKqxAD+rs0cqDFc6nmGJJbdJYvY9sEER/Jrz72oAsmSz55OPbZs2Gx4epR0jTUAiK0Binq4+hZLrt/cBd+sKGJKCYqpmnd5u5lbDTJ5JaHUVu1539SLfEAfXxJAbLW9skQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtwVAR5m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtwVAR5m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E5C1F000FF;
	Tue, 22 Sep 2026 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088685;
	bh=t497RnEMV/SX81+SUwhcnlYsTUBerAX8lJcQCB7HtAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NtwVAR5mHBLx8w1JjblXAmh6r/Li1HhVFV1TmSCPDkoOUWk9caToiHu+PhDEg8iMS
	 WlNkkz+Y7Z26Jw0dhgdzgGVxjKDCtHCIQxLbC0PfoVl+7g4idVsLw7VaUh0HjyOXbk
	 8yT2IyY1Sxx5QxknCOw8h4H9ym6ZYJol7+Pm2BUGOVDvm+pQg/nQEvHhkKUEN6b3pe
	 SkbNE3at1n6UlAL9KoW6SvWIgu9CNIeNcXC2+JuQA918jU3X+/JitB+dLJxeiBQxjG
	 bYSQmew+zOWSIokbZpc3gAME9o+v2m8ojGmB8bbMYwl8mBPWfnzMyo+cc6gdr4Lbvv
	 nXjGThC2yKkJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: leds: pca995x: Describe
 reset-gpios property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <3e6c859ffad2543243a9d55183e3bfbb9c5afe43.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <3e6c859ffad2543243a9d55183e3bfbb9c5afe43.1790087890.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 14:51:25 +0000
Message-Id: <20260922145125.84E5C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The PCA9952/PCA9955B/PCA9956B have a reset pin. Allow describing it in
> the Device Tree.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790087890.gi=
t.nora.schiffer@ew.tq-group.com?part=3D1

