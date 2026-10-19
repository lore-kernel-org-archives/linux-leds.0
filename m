Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF23F277026;
	Mon, 19 Oct 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404473; cv=none; b=FuKr+N5ZkvgNXFU8ClhvQ6yB94Q15W57P8VW7m0mZFedvWazAW5gomwnsS58ligj7gWv1LnzgXVCg08kZAiYoMyYXJsIOA/kXXjptDZuvRGXiOeYGnrXj71uOKZXDlJz2aCuMnIoBOVFC1lfoubt00C1j2b9aQJEAvuonWBURWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404473; c=relaxed/simple;
	bh=9jndbm2OlO7GrKdW1NB63iXt/4MYjHwJ7BADPMcwPCQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=s7X+e1PBlbYxjrVyXSyhEDwa66yZaNtmB7eYPiOKBqQhvMGehQn1lJGoHKYmsmMEUNxPbCygjBlWBXDA7Tp8Fz2hGeITgww/v5wfQxj771xsr2rGZLFILjeiu+xCCjv23OfrmclqPmD3yoGGMfJCelZ7vgJA4lRXYTxdxgqtoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbtopMlC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbtopMlC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A91C1F000C4;
	Mon, 19 Oct 2026 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792404472;
	bh=9jndbm2OlO7GrKdW1NB63iXt/4MYjHwJ7BADPMcwPCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CbtopMlCiSMAMGV+mSEcX0W0kDXHXsuS2dMUnrSPmABs66P71RLfu9f/DUapBzu9y
	 K10+e+7t7frbdKaUH2mN+OQzSYpvvZtTSn5KYq5wjbzEZ3fBF03+PZJ8jjkGQ6GODc
	 xXn6MjsWZc4GACcMzyC43qvF9gA0jW2/OTxTzRmFFtphFhCA5L61hXuv6mbJIe2Mva
	 J+vMvXxgt3e/wL9FZIvtIRXiJo6imPEiY+bGAMVVQzwQSc3J53HsMteAtI8+/vRwRR
	 fzQljO9g4fhjBMuOYwRz2jAyN8sJ41il6ZYEKDewKF5pFC/eEkwATGWToowT56xwYX
	 3OZhoSP9vhNzg==
Message-ID: <sashiko-outbox-176949@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/7] dt-bindings: embedded-controller: document ASUS
 Transformer EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261019100406.103687-2-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:07:51 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Document embedded controller used in ASUS Transformer device series.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019100406.1036=
87-1-clamor95@gmail.com?part=3D1

