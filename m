Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB163905F0
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 08:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881368; cv=pass; b=sBoHcI++wDqefRib/Yf4ro8WO20mj1Tf1FFBAVTC+Pg5bn1NlufDNe/HC40wnr/t+D/dEd8P1de56QuP0uagy+2e/yVCEw0m8wrul9nJ2Zz77qxZehvlmnXkCuzxrLXPyL3kl+49qtFDlE9gvteqQqn/jIhvybt5cn+JkaHdI34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881368; c=relaxed/simple;
	bh=05+TzFrE6wURrdbD4RkYQxWL2S7RN+hKvrxXNJt5MXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQYmQjFjaGPB1QrFk4M21tD4iz8NQX/NGRmfQ7+a95aL9sU9406lhpGPSqQDTkuuTlSSVk+/otZevJ204sonQ12mq8Jkxct7ze2X1moz3oEfsupZ4NWHIqj+TnrMbphbvFjWWtLDgtKvJv9ZaAOyBuJn5h/U1BI9mDruu/NEMZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNV50YvU; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNV50YvU"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so1485003a12.1
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 01:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791881367; cv=none;
        d=google.com; s=arc-20260327;
        b=R61d9oVHZ4i/enIPk1wVcXSu9tYWH6nuHgyJHcd/2PQ2m2Z0YAQxuVHo4K6tKEdbh6
         079D4r0HNIlJcMewxzPn+WMY+Pl08Wa1Z1OvUN/+/8kf1m9fA2GLDI2v3FQXmIImnNnZ
         5XaFMj/oTdNqQ1cDp2vgPNschfSSywpyDmi8+gBIbrTgwP4LCyLvs6VKUHLa7JPxrotc
         Nbowk7HhVSDvpGMPjT4z6U7mtGAJtgmjfRCRPgcXzlHxDuL4IBmlvvws5pnV83dISH/6
         /9hWzJMATtEsTad1vujyE5UUWo9iRDoltVP/bY2tgNgEKgpGW54RXjxECTGXNEbPwgGW
         bNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=05+TzFrE6wURrdbD4RkYQxWL2S7RN+hKvrxXNJt5MXc=;
        fh=9+/2yslTLV0NH/3blVD8FTP3qxRCNQEqEaQKGFpQtm8=;
        b=a1yP49ny6JIcWUV22yKcLADP9biy6p+/gAv5KGP8h4Cl9Q7KXHUSyX4qYQbnidhrwR
         ccfgM17xdtyqOmeXBxPkRQfRBNfs6eLdPbsdRqNABplM5FqiaMIpDiW4zBY/t7FiPOLj
         bKWSp7Ukud4qhbGS8Rslb5bng0wdp0EJlHN3va4w5hiMONCJ2oHh2Nk4evzbtT6kuT96
         UY/xuwPviT/sAZ2vqOGD7AD5AtFmpYAqT9oHxMDRcv3VoVVEz1bQTH5DRTXl0Cog7WNM
         Wy6gZ7faRwbYFgSTkGsWaLusux0XCxw8noVLs4Seh/20PjfbRxjZa+u7i+O0jv2fsX8x
         xPog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791881367; x=1792486167; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05+TzFrE6wURrdbD4RkYQxWL2S7RN+hKvrxXNJt5MXc=;
        b=qNV50YvUT/Dl0P0XxnkzbcuOPlYIhaII64QkxnI4hwyKgPUtlMLzcCo/U1jFS56l5d
         PPL2A9SRDEgYJcPO8YP9p8PElSr6ZwYbqobWHhRK4JcoHDlU1wY9WE424e9BvQP8jxod
         2r7HIx/heI1Tqc6oGK1BzpNjKrptFKkq8Hyi7fh4Q9B5k9L9JrjYIKIiW8wkyWq5k4vm
         ZUXkxi09iIv6nP9zEO0Mn3hBdSTMEROH9Madyk95aj6O5KlgH/+2TC4OzbUWld7U2T1m
         naBT/Rbvk3pMJ50vMvWnmFLIHupgXGO8rw0ffcWNqVYLg78yFhW1orHjU8Rhugn0bnF7
         30Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881367; x=1792486167;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=05+TzFrE6wURrdbD4RkYQxWL2S7RN+hKvrxXNJt5MXc=;
        b=emuyGALx9df0QxQMb8I+eSWcgyldv1frS3+PAXb6eGUhOLy32mK8S/wQWoisiaANQe
         /NRKKCG4zVgA9ArgTpVFhxbYtFVYv2ipYqODat57i5UaRj6qkdSVe5vLDQvp2wXHZkfY
         yN401IombtJ8J7CqNkJ1SsNCGeZ4pIYeJg9KuFxNIZpzj4UGYEBIAgU4Ui26OUyZryAG
         Xg5r+wcFtncAIEFcG3CYhoQNl367Ht5RDrHgn60FKUeYhrUHJYpBkEHEJ+zY5cWYAj+i
         RVcLgvr+z0B54XHpX/Rw7YamBhBev54p9dqkYeO40emWmy5LjNNufpmbZ/tJSE72gBex
         9JRw==
X-Forwarded-Encrypted: i=1; AKwUvBy4DYuoz1nJ4/ouchrG+fSG0GuKAtlkcptOJIjRVZUQLmZ8VkXCGBAflarJEsBZIcGbNJN5ogsWOm9J@vger.kernel.org
X-Gm-Message-State: AFq9FYKU1ZXesTwvfq9LCxOQVTs53FpLas6HSDzZU+P0bTHjiNtnoxj+
	iTa21NzMIEhRB9giD7SHIVxr2Q3D/n/GV0B90RY+tRjLuiPmE9HyYohV+atYjsVefV3HrIEy+yM
	TjW80GCJlAe+vna/dppxTN5BdFptcaqA=
X-Gm-Gg: AYBFou1ufxhf5dizqsG5aDiuoHm+E+X4JmZxHcF/Csw2pgp8hSNBRh1Jxy3zTL9t2Ym
	3CkK+m0vy5zR9cbrupYanMkRxLE5RifVD4kFzGwglu48HhVPHcHIsRcTITec3AX1oW6oipgVTRe
	l7fWOsC29weoLZpAOlJeN0zSyDp2dTdv4um8ETSA4dPSXrUOGgXSjw2lg7tU7uoqYQXGYiAlk8E
	j5PTfYaKYvJ81v7W54W0AoOEDpCHhTk5VSn+hJNggagpkmueECiZwmrirx24O4HazX8ynJ/JQH4
	iWXq5L0ojD290vksrEAj6kknP55yvh0Qfz2wKs06pCxJrmqyhOYYtA7e0awNAICikFRAxCuDXvV
	+kU3okpP1WwhtRuahMTnAQl9KmQgwk+mifiE0jyM2pDUwL9obOoI6+6Q869uGGCgNtCE=
X-Received: by 2002:a05:6a20:3d06:b0:3d1:39e9:b261 with SMTP id
 adf61e73a8af0-3e16b7aa7dcmr10821454637.0.1791881366815; Tue, 13 Oct 2026
 01:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009091059.25729-1-phucduc.bui@gmail.com> <20261013082441.GC199624@google.com>
In-Reply-To: <20261013082441.GC199624@google.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 13 Oct 2026 15:49:13 +0700
X-Gm-Features: AclHuK8OWPyPTBv5w267K9ocnsdZsqZeERbiyZTzVq6qJslWRdmCxKS4n-cxkqI
Message-ID: <CAABR9nEgZZrEJ-HLUfN+8SEdRhbZ6Jc-ybYk3m96twB-npS5hA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] leds: lm3532: Propagate enable GPIO errors
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

>
> Ideally we'd have the author review this - did you Cc them?
>

Yes, I Cc'd both authors listed in commit bc1b8492c764:
Dan Murphy and Jacek Anaszewski.

Best regards,
Phuc
