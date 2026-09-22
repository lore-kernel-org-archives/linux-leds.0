Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A0854937D;
	Tue, 22 Sep 2026 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089172; cv=none; b=Ey9AdL/A1ihVSNffmwO7nLZRyMB1aGDrIAKCvqVq5/e1r6o54N0y8A6bBp3+l8cVA+8u3TBaYJQPJd92T1+4SrK2ThMsZDIaH1p0eyqRRGJATa9HpgajBRkPvEFG5yhQipXsf8ZKg4HpuWRm703Vj4poRzKsDkd/ay9Bpoq7F6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089172; c=relaxed/simple;
	bh=xaR5vHbx4jh5eFXlPa25kl5X1BgmYjwM1WbZ/DEFXJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z9zSFjfcTtxWYc8QbJF7eHzf9SKJhM4slp+3b7UVxk6UNQPSpGXiIxTtKl91fanoMucc8dyMwcrswybsUHVDteWj87wUZKLNjJ99TnCld5/mg4EYqLAhMPsfQ5C+A4seTDMIJ0PwYZU9x0Ha9TeN4gErRjUCutfhmIrmGCihkLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h70TdxXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h70TdxXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37971F000FF;
	Tue, 22 Sep 2026 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089170;
	bh=xaR5vHbx4jh5eFXlPa25kl5X1BgmYjwM1WbZ/DEFXJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h70TdxXX/fvo99kWi7L1vO89yac6Ra/JRX9F4/fMEWTQDcTAITS/MpqvYy/4LEiL3
	 zqreNAIJOA415JIU7p7QuLhNTk32XxDzPaRdeQqoLvSZt8+ZR7cyyTppy/Kj7l7DN7
	 cT/ZMuJ2hZwdF1WnHfJ8IUdrhP5PozCfWLg9dBE53YxdfGRykHYkjfWjRuOv1JJYRF
	 3Bd4w5o11oMjA1U00YAsGN5Z0wQqsAaYf92++Dl1WL2szsatEiLYrTnnnhI8Hy8VJD
	 h+IL1lhjPvXwVWuiYcHz2rZn9SZ+35vgwlbm5jTbzaaBfgfjpI14rbWS+4tIfv1xRQ
	 yFI2iJ8f6LLmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/10] leds: pca995x: Fix fwnode handle leaks in
 error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <3d38609c96d387aec7eaff7cdb19fc2d8eb32a3e.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <3d38609c96d387aec7eaff7cdb19fc2d8eb32a3e.1790087890.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 14:59:29 +0000
Message-Id: <20260922145929.A37971F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Each entry in led_fwnodes needs to be put as long as no LED device has
> been created for it yet - not just in the creation loop, but also in the
> first loop that iterates over the child nodes.
>=20
> By clearing entries in led_fwnodes once they have been used, the same
> cleanup loop can be used to handle errors in both loops.
>=20
> Fixes: 82c5ada1f9d0 ("leds: pca995x: Fix device child node usage in pca99=
5x_probe()")
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790087890.gi=
t.nora.schiffer@ew.tq-group.com?part=3D4

