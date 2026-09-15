Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A13B9DB3;
	Tue, 15 Sep 2026 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482285; cv=none; b=A8LJz/P1WhpORil5PgjpADSrRoh8vcwr3MsYiQaIvvENzFl2IHJqwD0sgARlEgZwsck0ObIk/PjPMhzSnoLpRRcbC87gBIAO3oybzF3O9eTI9t6CUj5jB7uvaEC3SGh4gozDdnWfs+znhFfV/iMqn3f+Ld8if+x6WeAtiKhUnrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482285; c=relaxed/simple;
	bh=zcqkAnN3eHfWRmIJbb+hMEEVMXn2sWgFXFYprEC8D0g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M35lca8F/wGoZqdRV3hsAzilEGAR8ZX6T9F08nfRBMzPPsWN+yD1X3gy7se5Gj0K2or+4onp/y/rNWO02WY8DJs5f/kYr6+YztResVkRDtLGaWrLI3wHpSUcLp3B6GUynE2TtsNywaav5NDtQ7QGeKgNTXpf5Dh72YLbPjULjjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNJ+44LG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNJ+44LG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AFA1F00898;
	Tue, 15 Sep 2026 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482284;
	bh=zcqkAnN3eHfWRmIJbb+hMEEVMXn2sWgFXFYprEC8D0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MNJ+44LGwSK44jOyFqJqqP/4KrPeChTd+vHkYhnG0TMAuFZoztWuWmCGgx8orKe71
	 XHvXkGeXkkTVeHamAC2pQ6/xES8EZEbnkFuGdydkpgt7tTaNQSG1GyxggStfXPpSGE
	 svAKxLUK7TaJ5WUQcEH7GWufV0cKLSDoa4e2xAuz2hFmohgiF6OHhtx0oTFDPUev9g
	 zvqIihgQSRbIepHML8QUHe5VZgDpyFMaX2Q/hJD+BACvlloqgtkYyPZyD3sFSdx9cl
	 EwRXyJlRW3qieb+ZynYIink6em6Z8zL8QgRkCEyMq2hvlgaKI0PgeMtsyrwofoIKHK
	 3h8Rz4QUMQIOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/8] leds: pca995x: Fix maximum LED index for
 16-channel variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <c8b776cd923443dd455f4229d640e08ea4709d93.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
 <c8b776cd923443dd455f4229d640e08ea4709d93.1789477502.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 14:24:43 +0000
Message-Id: <20260915142444.08AFA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The pca995x_chipdef for the 16-channel variants PCA9952 and PCA9955B
> correctly sets num_leds to 16, but the value was not actually used when
> checking and iterating over the LEDs during probe.
>=20
> Fixes: 68d6520d2e76 ("leds: leds-pca995x: Add support for NXP PCA9956B")
> Link: https://sashiko.dev/#/patchset/6d3600f99c77c31166f0b6a5ccfb7f518b53=
c4c9.1788350618.git.nora.schiffer@ew.tq-group.com
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/bd687915af26ccdbfc8=
cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com?part=3D3

