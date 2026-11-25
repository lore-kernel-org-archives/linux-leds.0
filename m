Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632203;
	b=RTf41fMZmu7OYGPrf2z00Zt1exGdcWCvUhsb67Oa+hIrHb5NaQr5zcbRJw3/yHamXmNR
	 1v3xYXtucCmeP9eCRY+VsAg0T2+Kxnp9IcIc3QzR15WU6dnjGDLzL4Llf6TRAFYPJ+0O6
	 bySRVGAn7xrj+L0Zw6m1s87EOT6bcmG7yAYP+3d7291Pqo7EJBK7nw1jo1vE0wcKa3IFJ
	 3TfCsqbmrMZ7BUcYu1nPi1KAmdTn7htha693Hokf3wwPtuBOTp9XDsBvCrzKY8/ie457e
	 8uMCFnKyndmP5xPLCP+MgU33x+8pYiaIsgoRKrgYSMu2txVGRHqbQmDTUthaYXnNqwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632203;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oQ4VTQATH7dfV9nhnsk3OvV2Slxrx8pDo1YAeY3RBkg=;
	b=k299RwXQwZiqxxr18i+vuJrCuiYN8ngEnCl/zYT/rK7lZNMslMFmy8Sgxb77hXAmwR6e
	 3Q71dlV4sGCahGhMK7Nna0I+0W0APZfjT//+2M8bbrVNFghlwLDWePZfNQrsFT3gVvuRV
	 4mZppcyn0HwvUoJzkQr+bvBBhS4poY39xFZuToqTg8rR1ELXhCYnaBKHwaoKOxZzt1PSd
	 /9egku1Wui1uc5JKIvExrMySXAzXPZ//IE1o0hssuSkFkhb2RaxJ5Z/NvwgLMYVPCZmhO
	 3m/42PU3mnuq07gSXjFDlEISSrIbnSZrNH0y9mcm29cAndm6q1r8Qo3yYcQygFeD9MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OkC7INiQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632EA606A321
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 18:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OkC7INiQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B071F000C6;
	Wed, 25 Nov 2026 18:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632202;
	bh=oQ4VTQATH7dfV9nhnsk3OvV2Slxrx8pDo1YAeY3RBkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OkC7INiQe2+Qwhnv07rorJO8i9ueiZbDlTIvVp1IdIuXqENOenoc7fpTrvrMa79Wn
	 o3YAr5S8zv3p/N2hr49smrvSB92Jf63BmBZrn3VPlhm9HRslottqYOKxSW8aPbPCbr
	 VEgjyyTXkoKdbsom46XLb0vxEs/hfHdEttEv9MGx6jcZgVzA40aiz5LwqdnlAa9c9a
	 /oBYQ8bP1VyHd5X55/nQNDXWcwQjScEDAApLnvJW9gJECqo54N4dAMvMhLNLm8o+Nt
	 cXzqk5GVSHDgJBM6JKtfuf/5mGJ2mtPpGi7Xv72y9FCLo5pSmZ9Ab3XnSlMJIqztBs
	 72s4LotRYjBWg==
Message-ID: <sashiko-outbox-234010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 0/3] net: phy: dap8211r: add LED control
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:43:21 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125183742.3039=
752-1-a.shimko.dev@gmail.com
