Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174754;
	b=Q1E+ls1H26iS9zYLb6AXHcGDprugw3VND/isaKJ+nHPbT2BAepTpdn+RsgFKpG1+Jean
	 wyXXj9GJp/Rdk+85BgaYCaCKNaSZMm4yAbO9TXDQcGsc4hqB23Ur5viizHatvKQCcYbty
	 soq9QBrYj10hhF+9/zID02JRIO7pMOG5G5IVfIo2ln923XHs7JQC/FpN9aaXpPHC6gVv+
	 h0Q0DMdbIhU/ptCKHLGJomXH+/yZOndFuo8hzGlN1JX/1pp8y/e8n1AOdbXFVwpYKwcwK
	 RKMrmBpNCP8KoZgX1Bq1cjOPLjuq6gOctCXK9aiSRN1GqgLdKjMGK+QYlDu3UIsMHyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174754;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=H7/Lyb1hasrv1Ji+/Q1Z62q+f8Wt0/4T8TfyrJhM4oA=;
	b=FCLegmyOWWZgAw/oquq+mF7TBW8943yLd1rAe1jzCIWBq5SAf5HttQ8T51h2MtUNNNvE
	 aoT/+oBh9aq4R+gDQNe4JMgrhZNqDQjxUZAr1OI06QQxcYXSG769y608jYNttY3Pp3Sdu
	 C1NNFjWFvCZmYZpwok5ydsE4SZeJX6GT2nb1Zm9qmwjjNDBHb+wpXzABVPC4gezhlZ1UX
	 +8gxd1Wks8WxnpmosJSf+ZjL5GOBZBNm0G/AwnxR+XAt+76lMxOuy1sbGm/IpyLhbRyp4
	 zF+/zRLJ65q2Rgy26s7v9kfLxVLTYva76MRXQHl5esh/9CKqIcMSVHWU8rOWAY9H2Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DsXbp/1T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FEA606A31C
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 21:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DsXbp/1T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72ACE1F0089F;
	Sun,  8 Nov 2026 21:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794174753;
	bh=H7/Lyb1hasrv1Ji+/Q1Z62q+f8Wt0/4T8TfyrJhM4oA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DsXbp/1T2L60pyOyEqj1UkV+Ms4YKXrWFomvv7/LNRRpjX2v9Y82CSsBimxmnmKeB
	 O0/+d0qBqWCEUB6xiKXS9oZD8ahBPa/ccX9dNBeLFjXCrav8y99f7BIrw0BYLALEyD
	 AdHtTYBn9gzn1qbv4gcrnI5aZTim+U/Z6G7vv6nPjMdaKrg5r9HEiMNpZhRFs0XZn3
	 +SUKO3Ypnnb3ZfqG3mPvJmR+6EBlhTf49Ms/tfAf+5jiSHQ3c/X7AYkVc1lc4rm+g1
	 H6FwIX0/iCFQ4pHkfse8l+3JaJv/gZ5WBOQSQig6bRMq4TxcxeyLmUVGFFpey+hdsW
	 h/jt2UMiXpaeg==
Message-ID: <sashiko-outbox-204094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] leds: aw2013: Use dev_err_probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-3-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
 <20261108-aw2013-aw20xx-rename-v4-3-826529beeb52@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 21:52:33 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Failure to use dev_err_probe() for regulator requests violates
> LED subsystem guidelines. (At least according to sashiko [1])
>=20
> The original driver didn't use it, but it's worth cleaning up
> while I'm here.
>=20
> [1]: https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts=
/kernel/subsystem/leds.md?plain=3D1#L71
>=20
> Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-aw2013-aw2=
0xx-rename-v4-0-826529beeb52@postmarketos.org?part=3D3

