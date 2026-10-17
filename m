Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4BB364925
	for <linux-leds@vger.kernel.org>; Sat, 17 Oct 2026 22:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792277185; cv=none; b=JFDleo4Oo+/QnqcWIFhLfguWCDNPYO9Zbz3hIpUG9Uf2EmoIpGUt48+h+BK1D+XR49DH6JGXWvsEWJMp/rfaGaokfiHFFGXPtELsFfnu9Qlljr5BuNkHHuW+bcA2JpLFx9tPovZ9nnrm4skyRg47oWD10yQT9hdJiRfpI3Hldr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792277185; c=relaxed/simple;
	bh=C8m61NFf8DV0HdCB6VR2Qlt6ovIESt7TWheyDFaimvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXoqI4fl/ad9UbalwTZXXpIg8ucdcw1B6xxUKBHoDa4GdHBpQclF29LVpm2fjSf9lC2OAdfZ7o+PDBacyO6EXwgWXX2S+CGs+MrKQBsUZkTiDNwqMNHvaViPrhQtzxS7VIzfbjZkdTwZIkAyP/F1QSiSmyARWq4rRHw9LbBpRfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQXlom57; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQXlom57"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a98fc80925so7130081fa.0
        for <linux-leds@vger.kernel.org>; Sat, 17 Oct 2026 15:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792277182; x=1792881982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8m61NFf8DV0HdCB6VR2Qlt6ovIESt7TWheyDFaimvk=;
        b=pQXlom57F9xgWExabl30DX2RdB92r3gPnAc0aQJp/sEd6EQSgei+gz8aPgQVlyPPaP
         2tnvoc+xjvkIkt/lTsrzXKUWsFEUkQSLnKjOgEZHzsElPYSa7vGRhkxeU3vqsPWufsJV
         MX/HPjqGbLyZGA4Cg4KId+MJZURAZrR2JeWQB7GLshcy8INfeOYXCE3EQ/RRbYyqWpr7
         kfoUyzOty7m30EEITQui16/0PfO9SuqdmFQEv7qFyDoVh65RBHAzn+2sqSDiLVq3TlQV
         y0wXGny83ozhT4hDWuTo+ks+ZGWFUl7om3BzsGpIenRz+jS2aeyRrt6J0bioA5hPEbHK
         3QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792277182; x=1792881982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C8m61NFf8DV0HdCB6VR2Qlt6ovIESt7TWheyDFaimvk=;
        b=EdRcOGN0SfzZJD0ZKqthmoTGZwVxZOj1Fp39tai7qfnBfpjWCgL71vsrdlPx7fhKcA
         3yiQ/njpPq75TGFjQLBEwo783iIjnroNu7DXuEgl9o5Y6TUkXOXR7+amCFt3wupmB33G
         64CI5SK30rn7GpHVhrkg47DZEkNdGLFHcKQWiQl5/MPoHzOQGxNryKDQsoRQpbmYkyti
         ScJPJjxolZKBLsWINuR0+UMkZF59BpSi4dLiCZUhlSUsIbNX8cHlMTKji9jhkjaFp3T4
         CJGru35RGzD+4vdWApNOZD7NpKH4litolxUiLPLfEgQ5qMCiZAAvoXWfNnfNpgwfJTqx
         u3xQ==
X-Forwarded-Encrypted: i=1; AKwUvByUW3PVXF52wdV3q5rMbCROXbEnn2pmjrn8umzyXaEmTdzW2oWAaeKPWiDDaeIsB5XmeOTKKIKYpcaR@vger.kernel.org
X-Gm-Message-State: AFq9FYKs0wlVlwuQ0mzxJSHjVSHmbM+TU4lOyT+WFchoPhupJcey/CJa
	bpSQY5rERNt0bqzvZ3kMbrufGXLfrSXUSgRbyBlRFhUUnkGtx6XIXk6X
X-Gm-Gg: AYBFou2CbgI4jVrS+JGhM/8YWUMKAgI5gsEmkO/HMp7BVmXT+Ek6k2QoSPWVjyOqbfN
	u6xVZY/gBdeb0jC7HSz4Bh2fLOhIZDDVg6HBaCJ9ZqOGckkgSZRHML8hCZxlb5mjNdtoipAC7Rr
	AzRuL0g0cB2hJoJMNOq0/NdjhP13hnrwN9SPg10lUC5pM98ntvE0ANSWwtM7Y/Xz8fIqJ5smJvu
	9PaeP+DT5yq7UZl0vlqFYcWag+o/y6TZwBfXLoWvJitoVeCD+5qTcKnwWVWo869i3ssjsfphj69
	bxK4f9OgA5EMDHXBmkqExdNx5S+jkzY2ozxPF8jCOt5rscwntZHPGjQk1JgFoku261Ym/0R89K5
	Ddl7szj1ZVRVwiuAZqif7MW4eEboxZ6IpCpoerOg9+rOHSmm0XhLu/szOX1GCqL+b23Anb1Ps0R
	xrcC5GHp/4mYKZ6aiesgTW0nqaeeekRdR6dWX62HSF+hS8Rfr3GvlqamlX+YCBEY4=
X-Received: by 2002:a05:651c:1986:b0:3a7:812b:cec with SMTP id 38308e7fff4ca-3ab28e59f8emr9041711fa.0.1792277182044;
        Sat, 17 Oct 2026 15:46:22 -0700 (PDT)
Received: from quietus ([107.189.24.213])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16e43b79sm16786741fa.11.2026.10.17.15.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 15:46:21 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org,
	rillian.grant@gmail.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: flash: lm3643: Return to standby when the last output is switched off
Date: Sun, 18 Oct 2026 01:46:16 +0300
Message-ID: <20261017224617.430992-1-koreev.r@gmail.com>
In-Reply-To: <179198511712.839288.17752967041610699661@kernel.org>
References: <20260821083620.68324-1-rillian.grant@gmail.com> <20260924172040.1185688-1-koreev.r@gmail.com> <20260924172040.1185688-2-koreev.r@gmail.com> <179198511712.839288.17752967041610699661@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lee,

On Wed, Oct 14, 2026 at 04:21:51PM +0100, Lee Jones wrote:
> Given that the base series hasn't been merged yet, please coordinate with
> Rillian to fold these fixes directly into the next version of the original
> series rather than sending fix-up patches on top of an unapplied RFC.

Rillian already folded the standby fix into the driver in patch 2/4 and
included the ACPI LED description as patch 3/4. Both were included in v2
and carried forward into v3, posted on October 11:

https://lore.kernel.org/linux-leds/20261011191026.149338-1-rillian.grant@gmail.com/

Please treat my original two-patch series as superseded.

Thanks,
Ruslan
