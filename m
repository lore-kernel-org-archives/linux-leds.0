Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4DE44DB7F
	for <linux-leds@vger.kernel.org>; Wed,  3 Jun 2026 17:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506444; cv=none; b=TAp2kJS2FWkN5OAQ6ehEtIAntT4iC2GdffGB1mcSELUuoeeAziiLiWzB/+1KU5k9R70zPOeOwFB8krnCa8mcA3trBW+HBLTlfnzafF6ytcPr7n95cs2piIh1UyjkYIO7GT1h1RBTIJe144wzO6zlR+DXqTkx5Xk2Y14VE+bFRTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506444; c=relaxed/simple;
	bh=LMWL5z0PUBz/1/4zVtrAB3Slt0tJCvRIQSlyKhfG1Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vx4BYF9OPn2vYacm5QUjT/j5+DdA2SEyI3o9la6iChDfxkSXJPEtTestnS1qh9YTD9fybHSI5xqw0sbqvCHzWs+U+4pi9JRen0xJTG6dU7y6gxs+ZvI8H35Vzo/8ZGEcV6aWKVr8EuVR++uy4vixYzy4yJ/417hcvrnT4lwv9RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3msmcDA; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3msmcDA"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-842307473b5so3103276b3a.2
        for <linux-leds@vger.kernel.org>; Wed, 03 Jun 2026 10:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780506443; x=1781111243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qnoNQ6TPVeQqZZfaJltcjq9kwZ8+POJQlduiwlUGeUU=;
        b=V3msmcDAXuY0jk2quY7iEEo4lnBO5cReHTbG6ZvjHEU96mRCZKSWBtTUircFZb3Wsd
         Di/UCpeHUcIUrAgH299i0KGUS38x4xCdGSW8wMYVe8zl5DYN50WaPnQbbAbAHieTIpI3
         v3PSBvGYm3ltm9d/8/EAsrIPr8rr3Rkq8m5Spm0c6Ut4MnwVAXyUawolvpDBwTXarU4W
         jiN02eAUFvFF54jUbUk619C5+GCGpbrQemhvCbHmSqEMLkjyObP6dbwtSn0QjS13QGJN
         P1TQRYWyVTWdGIJFL7OUJrYCpnvjDzF178uJsA5U8S+kbOgN/LcvMO9qq63urXtPUX7J
         F+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506443; x=1781111243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnoNQ6TPVeQqZZfaJltcjq9kwZ8+POJQlduiwlUGeUU=;
        b=rJ8mZHeesAOgvI8WKDEjcNfjZ9bUPQAj9qy5Y2gKZBJ6xHhvEeBp2Uqr6T50uJG+ot
         N6qdRhv1+l+xDx1b0yt0OOrhOz0Wk0qT3wvHEs4pihzOaFlaIvuM5LXVq1khTyvq2lI4
         2qV9g8Fdu7e/Yg6PWT3WGS2/Nff42Fem0d7VYPAeRA3DDrtl0dRpXySWZTKlN9LaAKL4
         ++9zwcxdmLaHJfl1gJpMbpO0TbjnlQbx0OJP5yJWcHpmySeMmBgRxbuQgw0R4OJon+NV
         j/tdU36fOnvEmStmW0FnOBUhhf0gePqqcW65AymzSsH+IkInz7Sm9AfaezRQQm8ehFJt
         63GQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zezlFL8guOtOaAG9h/rwknA+B/wD7frC30eHDJSFtBkfWbuu9WkiOjthICuo3NTPCk8eJkeeNUuQu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1L2WL9S6tnywqQAJLvY979rrz+ifU6Q6kS76dzY8xoGmg2yke
	Vj5pU6Ce7agY0Ts3iNZiHCJjMKlpWSZWhgzoi1wzxSuTPWoXo4XAH952
X-Gm-Gg: Acq92OE8FeD0ltcMdiGXO/wMYDhp+gXpmKPQBiwpnKWKqyOUYmbb21iKirV8eQXDd93
	bO8p2XrXjbcGyGlHz73oThcMsHFN029e8jBQvfDWunjAaRdUJeStO0mtBiAsGDIPJF0b8MNkdqd
	S+jonxI36YRZTaZe+ZnX+ANb2rZUpeXObMCLKoytgpFmOjVlmxQBlqgrDHhYn9VEXgBZN+uVJ9j
	NXDFkED5WKV/X8UHIyvFY7UA4JJ5HJheEnxnaOh0i64X772JWW6sJznOAjSojlK59wGsr+qWIKN
	+4UULfJP8wyD+GUhcAX442ZhiaEbqRHsma7LJ+DCm+QE6qlPAgSEM3QIOCouSEW0Gxhy4GQRx6o
	r/SZuIVGDSf6tsY4T7A6mP7TfdwvgQD7vfABfdxglwp18atHQkHlxCJKaEGVjM0chWUfw4uOI77
	exiirSGsc6EdaGq2GnM5WlnfkE0uDzfSycMuLB
X-Received: by 2002:a05:6a00:3317:b0:842:5564:2e2a with SMTP id d2e1a72fcca58-84284d5a532mr4552805b3a.6.1780506443037;
        Wed, 03 Jun 2026 10:07:23 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282378986sm3777135b3a.22.2026.06.03.10.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:07:22 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:06:54 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, jakub@cloudflare.com, 
	maxime.chevallier@bootlin.com, nb@tipi-net.de, lee@kernel.org, linux-leds@vger.kernel.org, 
	pavel@kernel.org, jv@jvosburgh.net, michael.chan@broadcom.com, jhs@mojatatu.com, 
	vinicius.gomes@intel.com, idosch@nvidia.com, razor@blackwall.org, hare@suse.de, 
	jhasan@marvell.com, danieller@nvidia.com
Subject: Re: [PATCH net-next v2 11/11] net: ethtool: make sure
 __ethtool_get_link_ksettings() is ops-locked
Message-ID: <aiBfJ8rbhl_VPiGt@devvm7509.cco0.facebook.com>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-12-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603012840.2254293-12-kuba@kernel.org>

On 06/02, Jakub Kicinski wrote:
> All drivers which may call *_get_link_ksettings() on ops-locked
> devices from paths already holding the ops lock are ready now.
> Make __ethtool_get_link_ksettings() take the ops lock, and assert
> that it's held in netif_get_link_ksettings().
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
