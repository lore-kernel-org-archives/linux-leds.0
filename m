Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.208.23.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075827;
	b=G++iLOOf45UxgN2I6SK6Ub6fmR8MRalI2rOOeZTzw9ylkGSzXxELGbJ/ShtKcUSJHS2g
	 gDVKJ7k1wBDot+0L6tqBfjRp3k+mFq7KY45rQOgP4iZDrO8yTqaDY6YEHPIcn7+StXOiU
	 3PA3VTYgxVq8frTfFmrdmvOQMJqEg/E2Pcu/H5y/XugYHokQ8z//YWIKv975ACVFsqNAx
	 au3LbnL4wEAiqFk0sHnDN3dN5JW+VBP82vK3a9/yEvzRjaL55bknqiQ3vMcQ8sRYBA9rr
	 HyRUe/ldsFIjB2ksr5H636Fq3fX10PTyR0vJAXujcHCEXC2MmeBIyxIrxMy92opMoNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075827;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/IwveEA1U6/di/OdzdhRaOMftJQ8gqPFV+2Q32rwGuQ=;
	b=aqKFt4SQAtF4J/1QcGLLzHNd9kUgF/yQ01FEzVkjuEftm0NTUgKVvRLmzgp8Hijr45K4
	 VW0s3xINttSmN+WlSNK5iKr0kxe7fysbFOLxdVF1/7lrwRkty9pYMU4TBhBQHscqDDTNi
	 Y91hJ4+KfHUxpHwDw+OH6tS4lyAZ4uwuV/xXqoOSdmKm8bwfltA/S/mJdKnQIDm+ORhlV
	 SB9GRgk2qVax1/B/zb2XHq1MZsShHKann85GbwhuBcAiRc9n8fByy/uH9QqnaOrVvNgf/
	 5B0kCQ8Gj80GRm/NItOBMteiDl9ngNZpCBmKJGyVNiaVuqq0qB1WmCt4yIkAtmuLtqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=emfend.at;
	spf=fail smtp.mailfrom=emfend.at;
	arc=none smtp.remote-ip=194.208.23.36
Received: from rmisp-mx-out1.tele.net (rmisp-mx-out1.tele.net [194.208.23.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACCD606A320;
	Thu, 19 Nov 2026 08:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ACCD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-226-106.tele.net [194.208.226.106])
	by rmisp-mx-out1.tele.net (Postfix) with ESMTPA id C26E018BD04B;
	Thu, 19 Nov 2026 09:10:17 +0100 (CET)
Message-ID: <6f690e2f-ecd8-48f9-8852-b928defa918d@emfend.at>
Date: Thu, 19 Nov 2026 09:10:17 +0100
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] leds: tps6131x: cancel torch refresh on flash mode
 switch
To: jiegu <jie.gu@leica-geosystems.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 gujie <jie.gu@leica-geosystems.com.cn>
References: <20261117064328.4096518-1-jie.gu@leica-geosystems.com>
 <20261117064328.4096518-2-jie.gu@leica-geosystems.com>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20261117064328.4096518-2-jie.gu@leica-geosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jie,

Am 17.11.2026 um 07:43 schrieb jiegu:
> From: gujie <jie.gu@leica-geosystems.com.cn>
> 
> The TPS6131X torch mode uses a delayed work item to refresh the watchdog
> timer and keep torch mode active when driven over I2C. If userspace enables
> torch and then the camera stack switches the LED into flash or external
> strobe mode, the pending refresh work can still run later and force the
> device back into torch mode.
> 
> Cancel the pending torch refresh work before switching into flash mode from
> both the LED flash class strobe path and the V4L2 external strobe path.
> 
> Signed-off-by: gujie <jie.gu@leica-geosystems.com.cn>
> ---
>   drivers/leds/flash/leds-tps6131x.c | 2 ++
>   1 file changed, 2 insertions(+)

Tested with i.MX8MP-EVK and TPS61310EVM.

Reviewed-by: Matthias Fend <matthias.fend@emfend.at>
Tested-by: Matthias Fend <matthias.fend@emfend.at>

Best regards
  ~Matthias
