Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C272A24EA90;
	Fri, 10 Jul 2026 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691681; cv=none; b=eEJq4LkHAKAvOaeiOoqlbqUhHmASpPzaiWIAaMrfSvT5ndTiPX2hj+ebnh8TbGS9jVoEsB/CTCI1xKvD69z7UEBHpnqeCOINkoEEPMRjyn1kWXC1jAYdAm4gxJhY+VaCHntcbHGmKnvdLiJbxkhQBI3cokQQUZwKNb8IO3+Z/X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691681; c=relaxed/simple;
	bh=MHYrCq3BaeJDUmMgfQh0QKPmGQAuXZKpgfBoD9Kh1ug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rfXwykfQyV4KOfQcTedjKvwFSGv2UB4bkU33rMc8b1Hde2+xSuHBSwH9WFWeNJfAza3gRJVleE/7S8oepKF1t9zHX3NTtWGy24adbDMqpR6gr0zRwCfv4OemfdccGxQO4Gxhw/JZdf6rjSIVpFVAWBIONpAXfl6rE4iUWHRSCOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5C98645; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5C98645"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099381F000E9;
	Fri, 10 Jul 2026 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783691680;
	bh=MHYrCq3BaeJDUmMgfQh0QKPmGQAuXZKpgfBoD9Kh1ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b5C986456385EuumpZIi+pVnxu9Nxc9vfrRDXLNil1PcLqPhJqVO+W1OvTF7G3Yji
	 MaHPCpV42uEvjFpr8fev5v1FHFMM7+gbWHa38cNUMKRUV4ZmX0xlrlA9ZRN2JglBlB
	 /XCB88WEKqbikH4hK77k6y7FTO5XcYwCNZS4f5BKfwp3vGdQvquTN0s4Uao11ZPHkB
	 vTfeWYeD0AQDKUy9WGZnivr3LYMVHGreycygs8qHgTDJk59JSrSYUp7uCBTDmaavzD
	 VNljp9CELv/i369XYtTuCIqLfom4YOZmSA9fQyAYImBsOkKlb+TQGzPtxdKvji1HnG
	 AWaGAauVYbdmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum
 for pca9635
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260710-monza-leds-v5-1-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
 <20260710-monza-leds-v5-1-a8972d28c28f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 13:54:39 +0000
Message-Id: <20260710135440.099381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The pca9635 supports 16 LED channels, unlike the pca9634 which only
> supports 8. The allOf conditional grouped both chips under a single
> else branch capping reg at a maximum of 7.
>=20
> Give pca9634 its own if/then block and set maximum: 15 unconditionally
> in the top-level led@ node, making it the default for pca9635 and any
> future compatible. Also tighten the node name regex from [0-9a-f]+ to
> [0-9a-f] to match the single-digit hardware limit.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-monza-leds=
-v5-0-a8972d28c28f@oss.qualcomm.com?part=3D1

