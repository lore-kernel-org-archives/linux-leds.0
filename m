Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23379366061
	for <linux-leds@vger.kernel.org>; Wed,  3 Jun 2026 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506442; cv=none; b=uJU7u2VWyEsF6XnDqg6lmRoWYLLJ/9M/Q+6UliY28x6mJAitY0ORdlmqtvZm7yNSKp+5KcvtL+IFO0CFlMya/I7CfPjRPTSTLd9AfuShhNguNKfhKYkzcMZlZ2AcY1iOGlcc60W5iL7WxkWEtuL7V12LkWSivX6vmOX85Sx0Qpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506442; c=relaxed/simple;
	bh=J5sX2SrdIEkcShCVX4FKwqJy654ONaWz4XVjBJ59Zsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0Qg9AWxE6On1AGbS28d6OVngJIJZDWk8lH10cUcUy6Kz1Gn0ZOcofjG2kLCCq1Mha49gXe1j2QgP31Oqxk85yaTdHeyVA9tUlD1f7d7204StYB8NeM+F3o+7WyZ9eoie8ZeFCQB4Rffbg32mn2cbrIPsjQU3RYj42+I4HacV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUd+AGyf; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUd+AGyf"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso3643417a91.3
        for <linux-leds@vger.kernel.org>; Wed, 03 Jun 2026 10:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780506440; x=1781111240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cklV7X8G7kZSGfZd5gIj6cS62hnTZV+K0oRqAnA4spc=;
        b=QUd+AGyfBLLv91sCllQI+jko5gOfwvbMq7QADa/iypeoGE1A1++yZbXFg3jmHpKBV7
         3cH8IdwXj1cHsl3+INuqFXIjh6zIHwIvgrnvnaAjp9Ihy+oXH0K+JzQ6TlyIktXeHj0T
         uIykVQ31cYeIFB6aqRtzetsk+7R9O/ZowUsEcw8ccxyvnbFhTI6jUzmeAe8jOS45hxZg
         PeQ0BmG1xvN5yNS7ACzYq1WbAwjL6gIl6JAxmO3ZR23GTevkxDHtr3hnKLc1O07CCRcp
         rw5mdSuK/JAHvTNk1SwLDs+X3FYHjlSd+fGmUGPYSEza862ksCg3ONJlKD2mYfqpnxDU
         11iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506440; x=1781111240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cklV7X8G7kZSGfZd5gIj6cS62hnTZV+K0oRqAnA4spc=;
        b=DcOQ7Og0CtGmWUoyEKTKZKV6XTvTIGmtzF6A5r0w5e2dveE8HzLi0o3mt/kIky199u
         6ysPMxcp4OXLnF0H6jBOIrhIVzAZzLQKEckmLsgvFMgC7ryMF6fva9BqAYO2+EBaNEIh
         kgLfCp1NhU7MZmC2FPJw9bcoimk2SFmYyDCOUVGt5jeCV4UmEhBOQvwqaXkm7D2z/zUb
         iER2eXr2AaTt/fUrr2RWcfkWvdcRXADl06Gp2EQZqExkQOln5JMbCk4CXWLlo+HMrP2c
         LicEWmqh0/bdIT2bb0IwZtlalZJeGD7+7OwIY6/yQSTwTM1XjP4G/TNUNfijM6nu3Uno
         GPGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FahBAv8PLDrIx1yc9RyLtkPpL3L2suybD63oR7bzj/morZs6eQbMnAbaenOrpmgVvshhQo5K/Tcr2@vger.kernel.org
X-Gm-Message-State: AOJu0YyNfSV7HDXZkAEGwxviAnDfHqsp3PsEi3ANuwEPyTe0sN+e3RbR
	IpYJqUuBEyWuMGZIDINNKYzjNSYdWbQmrX972tslao0/+VGCWf6a+eOs
X-Gm-Gg: Acq92OEQZumLTQMvkGKplKUf/BW06vkx3EbN5tOXTl+/1oVOTRWTazzW6izTYdAGyZC
	rf+RhAPy0pHYKQvU+/TtLjUxqSr222/LT5TNtriw3lEOdJHOqCVmmCs8pKhvBSzqzeVuQXws+K4
	2IDsYf4k4ANCMdzcMtX9a6AHWRMnzJ5ut837Ej3F6P0ysQm2y5G1SXAM+wDOnb9KAAjoqmQB6eq
	hb7xWnuE0g5wfFMwG5cq7Lh1KscfVWyRHnysOU9Hhm9ByOqWCBqjI6B04sp45hl76dVYnxmljEJ
	81FJdoVCFA44IF9GE03a3dHbxXrEV/ljEsrR/hsj9L7BwGGKCW31+4yIRmdAfTRINZLo6mgsgDP
	HaMGqW6xqt9oTMWZwKomHOwgQiDtNz7rE+AmomKBS/XT6InkaaqAMbdG2986rvAOd5rNSMuU0Ar
	bTuQMeqbVPbxfejtdD4wv3YrePFbs=
X-Received: by 2002:a05:6a20:c996:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3b4978a1ab6mr4790527637.25.1780506440501;
        Wed, 03 Jun 2026 10:07:20 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:43::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df045c2csm2739601a12.12.2026.06.03.10.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:07:20 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:06:02 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, jakub@cloudflare.com, 
	maxime.chevallier@bootlin.com, nb@tipi-net.de, lee@kernel.org, linux-leds@vger.kernel.org, 
	pavel@kernel.org, jv@jvosburgh.net, michael.chan@broadcom.com, jhs@mojatatu.com, 
	vinicius.gomes@intel.com, idosch@nvidia.com, razor@blackwall.org, hare@suse.de, 
	jhasan@marvell.com, danieller@nvidia.com
Subject: Re: [PATCH net-next v2 02/11] net: ethtool: cmis_cdb: hold instance
 lock for ops locked devices
Message-ID: <aiBe8YC36vmcdFiN@devvm7509.cco0.facebook.com>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-3-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603012840.2254293-3-kuba@kernel.org>

On 06/02, Jakub Kicinski wrote:
> FW module flashing was written so that the flashing happens
> without holding rtnl_lock. This allows flashing multiple modules
> at once. Current drivers can handle that well, but we should
> let drivers depend on the netdev instance lock. Instance lock
> is per netdev, and so is the module so we won't break parallel
> updates.
> 
> Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
