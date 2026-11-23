Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416204;
	b=z0IaBVFtVWExnEOGkVxohTZpajG83i/iHCHyHpa+hBboOa6cVisn+B26/CLyfjiVBACh
	 HH1H/af8S+Rf7AKTmEsDJGg+XwRjCWSiZ2EZ34RiDmJDHww+u8EeEnH7gzui3DYUeSJUn
	 35iRMt+F8u8euO5X+Gg3sE1G+EeHMvLKk9MNHxYU8KLAv7G0/B3cLUMPbvG2ls95fVH9i
	 sSj2GV/xCUfesYsCQbFZRbGG1sdxShLoXuZiSEDaffe6fgS/eoSKzt+dND1F11tIv6bPb
	 8J9HQF2OlR67/olUbFC9rQo/LuD02RnKSV+Px77/hcLqN07RzAhT37Q5YWpSVIAAifg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416204;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dv0rFxCKBD1LTNSZQiYmYL8y4rE+E79v7jWC+yWjLP4=;
	b=rVQb8uwayzLhjJ5B93KGMX/bvjsZllgJGVcBRmJk3PJRwXKZRp99/XoQTkQKHrXY09OL
	 sQhfnzS++NGQNuzsYMD8QxxX6jFM1tpo+Yymvr80J9nd9HKQXUhqZ4rFDbRE3NaEvLCDF
	 o+I3f4I3643G+rSO6yCI2//XvVQSCrEpYb11mVU/CP6bKk6H9zkSzlKEGeqvGaB41kqW0
	 i4RedHwnbzHXaJgzqYpdJDdsRqZhX6ipB0cndNSKOPJeqo0qm/9+q9LqY/yxEfkZns5ec
	 L9y1PGlXoG3lqqXPaYWg3ntfzKwhVv0Jh0sZrC7tuMeutoCGte5l0pxS44OG/3BLX+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUueTBVO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA5C606A31A
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 06:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUueTBVO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F77C1F000CA;
	Mon, 23 Nov 2026 06:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795416204;
	bh=Dv0rFxCKBD1LTNSZQiYmYL8y4rE+E79v7jWC+yWjLP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WUueTBVO29HoM1cC4cTJNF0TJpKF8QbXpy9fVKuAqYirlTSWK3qLaR3CKaX9ZaeOK
	 EHw9LPvWPEj99HMxldtRYFm1+m9mJTQTqERwElH1/yvhweFc3A9GIobRie2W+PQlgR
	 9qwsnXdc+3UL8jGUXFjIG5x6R34I0WHB+x45mZXriD5sAPuJiNe/NQziMFJJnBdA04
	 OWMupsA0eyaZ8Rl0tnodRq5JgcJKmJOVyOMmQaAmAS0eSrj/xNaKm4+WMBDbMBF0og
	 31lR0s0dICvOyTZlSc4H99Js7UEKA1dsA2yA6DxkXAj+7M8HIMOgExgAY8y4cJYdfM
	 ChlBb7n9xhwng==
Message-ID: <sashiko-outbox-228778@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/4] leds: leds-qcom-lpg: Add several fixes and the
 PWM frequency mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 06:43:23 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 4-patch series:

- Patches 2-4: no issues found.
- Patch 1 ("leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak"): 1
  potential issue (1 Medium)

A detailed review has been sent as a separate reply to patch 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-led-qcom-l=
eds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com
