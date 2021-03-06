/*
 * Copyright (c) 2007, Vanderbilt University
 * All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose, without fee, and without written agreement is
 * hereby granted, provided that the above copyright notice, the following
 * two paragraphs and the author appear in all copies of this software.
 * 
 * IN NO EVENT SHALL THE VANDERBILT UNIVERSITY BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT
 * OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF THE VANDERBILT
 * UNIVERSITY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * THE VANDERBILT UNIVERSITY SPECIFICALLY DISCLAIMS ANY WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE VANDERBILT UNIVERSITY HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 *
 * Author: Miklos Maroti
 */

configuration MessageBufferLayerC
{
	provides
	{
		interface SplitControl;
		interface BareSend as Send;
		interface BareReceive as Receive;
		interface RadioChannel;
	}
	uses
	{
		interface RadioState[radio_id_t radioId];
		interface RadioSend;
		interface RadioReceive;
		interface RadioSelect;
	}
}

implementation
{
	components MessageBufferLayerP, MainC, TaskletC;

	MainC.SoftwareInit -> MessageBufferLayerP;

	SplitControl = MessageBufferLayerP;
	Send = MessageBufferLayerP;
	Receive = MessageBufferLayerP;
	RadioChannel = MessageBufferLayerP;
	RadioSelect = MessageBufferLayerP;

	RadioState = MessageBufferLayerP;
	MessageBufferLayerP.Tasklet -> TaskletC;
	RadioSend = MessageBufferLayerP;
	RadioReceive = MessageBufferLayerP;
}
