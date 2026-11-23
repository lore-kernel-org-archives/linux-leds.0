Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417962;
	b=f2qEQ5DzWiMolRc/kTx5fw1upuXT56tKu1BvJlp7H2mpvrgDEpQc2eZHVvpMfiCdo9pT
	 H3HtJTrPiPEXaERCkZGVbb8BSR8hGl/z2HoQrxOW0spOOtYJdFSSO+C+/lh3nScvaLwl+
	 QphQYYnp9qXcPrlaebgmSe9R/UrcwFGUHYz/E/NsRdO+fUMrf6HJX0ckzSMR87thIq7SF
	 cG07vMBW95b89ahxEHhXqLKr/tLDG6gGB7vkSYi5w4nJWGwg6NWaPLEnNKo4ZCIEic5OM
	 5skh5FBPtI1AoyDlnY5AEns9OpFGXeQnH1J5gjvwBMNYzXKybmtHLLCW2kM1tRK4gNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417962;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QR9PUIVyLMbWFgYpBmnTqBkN0jIpPD8IT7F0tSVndK0=;
	b=vwfIm2ODqb/65xGrU4vyAl0dvhkSSuuJ1bNswdf18KqibY7+Ny1k6/Gh3G+ZGyaMzTvI
	 pIPZZVjv4u041X29SqNIasssvziBD1MSOQxVWso3iu70uJlhQ2KS1sKgc/OzITuUYVbwC
	 yB+A4ZBj1FYVaLVEMvhCMu2kWJPEhuoAxSNFwMX6ZVwUFmuehiEn8UFbsiqQoD9/BUlnf
	 aP3TwLFMwhccPnXX/wonTWVlXDYC3KZuj63ct/P2IvuRy0VbyVRy+joavCS+3nU0YjYte
	 6Dox6AKA6WJN8uDf3V4zm1JPwXkfn7Hvqvbw7proTHNc/kAIAdLW3HPAQQ8L2Fr+V3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CWwUB20r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA87606A31A
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CWwUB20r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D38F1F000C6;
	Mon, 23 Nov 2026 07:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795417962;
	bh=QR9PUIVyLMbWFgYpBmnTqBkN0jIpPD8IT7F0tSVndK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CWwUB20r0bnJOTgXGlxBQz13LBxMRyocrwxew/vDlH2V7f23WzBu3Mosl7t/+jfWq
	 CU5DZqpCs6SmyZ6RT9w+/In6fVcCeqYpAcxqrShkouR5AA1TbWMiUqveZr1tNsRkor
	 4Ee4hIKeVgXEy8tl3znMJgURSJB7kmshkriHm3bj9mnLJMalZrRdFbbPnf+Mtc+zfr
	 atIn/SP8cPPmcxv1xDMvA3csGODPg1JH4ZZXcZtXZ2JSbwGLzr+IugpWObydVrez0r
	 L/8PZVMdkdy5/5aPvWh1FqgnLH6y29rqvF9Z/QosrPq/xn6qZUxRadmkknDHj7vge+
	 DugC/uXAbuznQ==
Message-ID: <sashiko-outbox-228802@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/4] leds: leds-qcom-lpg: Add several fixes and the
 PWM frequency mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 07:12:41 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 4-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-led-qcom-l=
eds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com
