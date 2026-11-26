Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718109;
	b=rqqWoVpSq9TVMfuRAcVx+v0RkiTqpy1AGxTf5NKK1v14PJOFJfsc6cHVgIHolenIiFbx
	 g0idnSyyuqXC1ZYVUoDLRy7VhS7NBcZPTyKl76wUFK2s5plN9Vy5hmM87Oj3uh3PKkP5G
	 yCcT8NDGvodDVX48Tspt4dmjSINfq1U+MjSbukjRSdhxghgxpEGeSGXmvCfOyek6hqY02
	 mbrRFgpt3ieZYrF87uBA1KJ1UZeYvxEElzizRLVESq2Uo23b1PvhNeqbjXxyHTMR/9HVA
	 kBeLL9/kWvXQZFBYSg2q3MMded/uVCQHjHNo7+Be9KuBiOZTJBty0Kt0aeKVn6TgvhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718109;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wYaT9GheDJwTt44VqFOiTwZ9DtNIu2zOtXmO6oqTiDw=;
	b=WRnpry2+uVMNWXOEsH1jyw5XnNkloDp+1MdzwrxTkCulrlQ/ij3AL7LhIavC6GMkOkFL
	 MkxB6CFywtfPMFp+jXSCPqpqnxQRPlpPHKnp8UqFih5nMsrKNGhIjsQz2MSOhEJ7Ro+EI
	 /xJBp2eGTd2l42pieNbjbUVbRFANVMtglMAGOW6aPSJHf5NAq0aYCJbog9if3JcHmGjLA
	 2ydm20Ze8sVr8oBzmD5easEkkS36qXZPMxR6hEPBYer/oEMRdF6ytj63H7gwu9FFQYb/l
	 2SFGwy4h8aXNoljQU9RAAFDAGguuK8XYpXSXCGAC2SunY76Y/sFQjMPyxxPYqJ26ZGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZO+TgZnm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE79606A31C
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 18:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZO+TgZnm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3481F000C0;
	Thu, 26 Nov 2026 18:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718108;
	bh=wYaT9GheDJwTt44VqFOiTwZ9DtNIu2zOtXmO6oqTiDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZO+TgZnmdaj+Rx1eOmZI4UiDe2VugssnLzJLZCM3EF8xhEs/fGfamdrFZPzplvU+5
	 6SpJFRcLH3ATnBgSwlPvt6QAqiJJ2s9kc+2pjB0WRpwDa9zFl3Fj4Cep1hxZoreaeQ
	 3tH3p6V2q5hM055co6NzK+vS/zFuQIXtRoDpqikzQdbcYQe1sEVQZQMIZwN7CGnoxZ
	 ylxlnjqKIzi4Sw1DimjqBujpjdfB20/Bk9y4UU00EZz9No3We1AEL+sSoOsEuV549i
	 4ApdZPR4J7nNElLbqz3sujyvZyqEKlyVJ9U4AmnUdbwSBwkFi9G2HDquL1xMGoLbNd
	 jSWKn/1u3zUmQ==
Message-ID: <sashiko-outbox-236026@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 0/4] leds: aw2013: Add AW2027 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261126-aw2013-aw20xx-rename-v8-0-b6960baa102c@postmarketos.org>
References: <20261126-aw2013-aw20xx-rename-v8-0-b6960baa102c@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:35:08 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-aw2013-aw2=
0xx-rename-v8-0-b6960baa102c@postmarketos.org
