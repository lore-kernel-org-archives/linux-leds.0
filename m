Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795516;
	b=axtoA0iqbgTclp8Knx/UPrq/jldKY4mAuq+k/+tXDN3af3F1FsndizEbQS3I8YvY8fHH
	 ruqnLkmMeeSMK0fqsAgXgEkjd3Vxh+ti/NE8vu2zCnK9Zq2djms7QWFuE64u7+2ylA6dz
	 fvmI0m7ohz3LQvvjErCwcJmLjr6JFPwbslWTWbuHnRzmNDNm1Im8s7//TGU7tcEmYV5GJ
	 kpL4bCCF+LAadFHmjAvmVjMI1hPpAEl4tRGjLqH7tjsRYDtkNHIZl8n4QR6UhCODNxe1z
	 K6qIx1BL9gYz/IVysykaOAXuRqYC4nOj93k3PHjFvoeenbC3wtlMwwKhZ+LOHakCJmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795516;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gRZuqZDo2MO49z651xLau16r4AJvqW2QZvwxYq1kx2I=;
	b=i8Md73TomebZm9w6HAZvnCCO3UCtwBlX8GBUFFXY8ohPduyOgz5YV35epsI5LZjDEmim
	 Ei2/FTXwpMyUraRY2TL0WzCnGWG7NOsBeqSXgl5dRgpFwLCYQ+lkYgoZNmn0hQPABY450
	 ZJykwuegczUwrD1u+uZx+2jflOLT73+ITsxfa08aD+RfpuKJ1zG/j0NjReEIZVUAf0Qft
	 jCN7pHvHuX7z/4wzV6mMAI8rAsl/WOQDUUfkMnBvnWQ78VufRJLeD4vniyRdrQQtTNklK
	 chuCpWjnpwhFCP8KNIKEFs9Bj70Xe7YMrppt59hPHGvl09YXJzEwYupF284qoIXe4LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChUZIiLk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F8606A31B;
	Wed,  4 Nov 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChUZIiLk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41B61F000C1;
	Wed,  4 Nov 2026 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793795516;
	bh=gRZuqZDo2MO49z651xLau16r4AJvqW2QZvwxYq1kx2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ChUZIiLkeH3Zy6cs/VpO9KwMiFl6c7L/mMzjxZl2HnMNztQ/iaEK8w19rIXhhwMOu
	 LRXRfvkLQmobp4cYwtEeCJDPJ4QWmk9h+g9yKylohpCms+KLa8cISaStjNLLWALoTL
	 SlrEpkuItyXPtef/8ua/lcrPGvraklIZc73PmiYmXWOWLyhq64jl7YWns5tzJ63ul6
	 AQ+ZoqmG2gHFnml00Dg/Ns9wTtIvOmUWAqk+5FddgaNV7CTjjtw1xkXW0730/wfrCL
	 tLDMuW2Usxrf/rBPNR6DGWdp3cFlt2z1rm664231+TZIEWRhcmr4znRVk17maB3htQ
	 FPwCixjfNV9Pg==
Message-ID: <sashiko-outbox-197257@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/7] dt-bindings: embedded-controller: document ASUS
 Transformer EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261104122606.215629-2-clamor95@gmail.com>
References: <20261104122606.215629-1-clamor95@gmail.com>
 <20261104122606.215629-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 12:31:55 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Document embedded controller used in ASUS Transformer device series.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104122606.2156=
29-1-clamor95@gmail.com?part=3D1

